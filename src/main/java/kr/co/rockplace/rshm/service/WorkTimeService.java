package kr.co.rockplace.rshm.service;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.service.admin.HolidayService;
import kr.co.rockplace.rshm.utils.CommonUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Worktime Service
 * @author wonsunlee
 *
 */
@Service
public class WorkTimeService {

	@Autowired
	private HolidayService holidayService;

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class TimeSet implements Comparable<TimeSet>, Serializable {

		private static final long serialVersionUID = 1L;

		private LocalDateTime sourceTime;
		private LocalDateTime targetTime;

		@Override
		public int compareTo(TimeSet timeSet) {

			if (timeSet.sourceTime.isBefore(sourceTime)) {
				return 1;
			} else if (timeSet.sourceTime.isAfter(sourceTime)) {
				return -1;
			}
			return 0;
		}

		@Override
		public String toString() {
			return this.getSourceTime() + " -> " + this.getTargetTime() + " (" + this.termTime() + "분)";
		}

		public long termTime() {
			return ChronoUnit.MINUTES.between(this.getSourceTime(), this.getTargetTime());
		}
	}

	// 근로시간 기준 정보 
	private final long WORK_STAND_MINUTES = 240;
	private final long REST_STAND_MINUTES = 30;
	private final long OVERTIME_STAND_MINUTES = 480;

	// 가중치 
	private final double WORKTIME_WEIGHT = 1;			// 소정근무: 1
	private final double OVERTIME_WEIGHT = 1.5;			// 연장근무: 1.5
	private final double NIGHTTIME_WEIGHT = 0.5;		// 야간근무: 0.5
	private final double HOLIDAY_WEIGHT = 1.5;			// 휴일근무(8시간 이내): 1.5
	private final double HOLIDAY_OVERTIME_WEIGHT = 2;	// 휴일근무(8시간 이후): 2

	/**
	 * 근로시간 계산 
	 * @param timeSetList
	 * @param isHoliday
	 * @param isAlternativeHoliday 대체 휴일 여부
	 */
	public Map<String, List<TimeSet>> calcWorkTime(List<TimeSet> timeSetList, boolean isHoliday) {

		List<TimeSet> workTimeList = new ArrayList<TimeSet>();
		List<TimeSet> holidayTimeList = new ArrayList<TimeSet>();
		List<TimeSet> restTimeList = new ArrayList<TimeSet>();
		List<TimeSet> overTimeList = new ArrayList<TimeSet>();
		List<TimeSet> nightTimeList = new ArrayList<TimeSet>();

		// 근로 시간 및 휴계 시간 계산 
		long restTime = 240;
		timeSetList.sort(Comparator.naturalOrder());
		for (TimeSet timeSet : timeSetList) {

			LocalDateTime startTime = timeSet.getSourceTime();
			LocalDateTime finishTime = timeSet.getTargetTime();

			LocalDateTime convertStartTime = startTime;
			LocalDateTime convertFinishTime = finishTime;
			LocalDateTime restFinishTime = null;

			while(true) {

				// 휴계시간 계산 
				if(restTime <= 0) {

					restFinishTime = convertStartTime.plusMinutes(this.REST_STAND_MINUTES);
					restTimeList.add(new TimeSet(convertStartTime, restFinishTime));
					convertStartTime = restFinishTime;
					restTime += 240;
					continue;
				}

				// 240분 더하기 
				if(restTime < 240) {
					convertFinishTime = convertStartTime.plusMinutes(restTime % this.WORK_STAND_MINUTES);
				} else {
					convertFinishTime = convertStartTime.plusMinutes(this.WORK_STAND_MINUTES - (restTime % this.WORK_STAND_MINUTES));
				}

				// 240분 이내이면 종료 데이터 입력 
				if(convertFinishTime.isAfter(finishTime) || convertFinishTime.isEqual(finishTime)) {

					if(!convertStartTime.isEqual(finishTime)) {
						workTimeList.add(new TimeSet(convertStartTime, finishTime));
					}

					restTime = (restTime - ChronoUnit.MINUTES.between(convertStartTime, finishTime)) % 240;

					convertStartTime = finishTime;
					break;
				}

				// 240분 이후이면 변환 데이터 입력
				workTimeList.add(new TimeSet(convertStartTime, convertFinishTime));

				restTime = (restTime - ChronoUnit.MINUTES.between(convertStartTime, convertFinishTime)) % 240;
				convertStartTime = convertFinishTime;
			}
		}

		// 연장 근로 시간 및 야간 근로 시간 계산
		long overTime = 0;
		for (TimeSet workTimeSet : workTimeList) {

			LocalDateTime startTime = workTimeSet.getSourceTime();
			LocalDateTime finishTime = workTimeSet.getTargetTime();

			// 연장 근로 
			overTime += ChronoUnit.MINUTES.between(startTime, finishTime);
			if(overTime > this.OVERTIME_STAND_MINUTES) {
				overTimeList.add(new TimeSet(startTime, finishTime));
			}

			// 야간 근로 
			// 야간 근로(22시 ~ 06시) 체크 
			LocalDateTime beforeNightStartTime = LocalDateTime.of(LocalDate.of(workTimeSet.getSourceTime().getYear(), workTimeSet.getSourceTime().getMonth(), workTimeSet.getSourceTime().getDayOfMonth()).minusDays(1), LocalTime.of(22, 0));
			LocalDateTime beforeNightFinishTime = LocalDateTime.of(LocalDate.of(workTimeSet.getSourceTime().getYear(), workTimeSet.getSourceTime().getMonth(), workTimeSet.getSourceTime().getDayOfMonth()), LocalTime.of(6, 0));

			LocalDateTime nightStartTime = LocalDateTime.of(LocalDate.of(workTimeSet.getSourceTime().getYear(), workTimeSet.getSourceTime().getMonth(), workTimeSet.getSourceTime().getDayOfMonth()), LocalTime.of(22, 0));
			LocalDateTime nightFinishTime = LocalDateTime.of(LocalDate.of(workTimeSet.getSourceTime().getYear(), workTimeSet.getSourceTime().getMonth(), workTimeSet.getSourceTime().getDayOfMonth()).plusDays(1), LocalTime.of(6, 0));

			// 근로 시작 시간이 새벽일 경우 
			if(startTime.isAfter(beforeNightStartTime) && startTime.isBefore(beforeNightFinishTime)) {

				nightStartTime = beforeNightStartTime;
				nightFinishTime = beforeNightFinishTime;
			}

			// 야간 근로 시작 
			if((startTime.isAfter(nightStartTime) || finishTime.isAfter(nightStartTime))) {

				// 야간 근로 시작
				LocalDateTime nightStart = null;
				LocalDateTime nightFinish = null;
				if(startTime.isAfter(nightStartTime)) {
					nightStart = startTime;
				} else {
					nightStart = nightStartTime;
				}

				// 야간 근로 종료
				if(finishTime.isBefore(nightFinishTime)) {
					nightFinish = finishTime;
				} else {
					nightFinish = nightFinishTime;
				}

				if(!nightStart.isEqual(nightFinish) && nightStart.isBefore(nightFinish)) {
					nightTimeList.add(new TimeSet(nightStart, nightFinish));
				}
			}
		}

		if(isHoliday) {
			holidayTimeList = workTimeList;
		}

		Map<String, List<TimeSet>> resultMap = Map.of(
				"workTimeList", workTimeList,
				"holidayTimeList", holidayTimeList,
				"restTimeList", restTimeList,
				"overTimeList", overTimeList,
				"nightTimeList", nightTimeList);

		return resultMap;
	}

	public String convertPrintWorkTime(double minute) {
		return CommonUtils.roundValue((minute / 60), 2) + "시간(" + minute + "분)";
	}

	public void printWorkTime(List<TimeSet> list) {

		long totalTime = 0;
		for (TimeSet timeSet: list) {

			totalTime += timeSet.termTime();
			System.out.println(timeSet.toString());
		}
		System.out.println("Total Time : " + totalTime + " (minutes)");
		System.out.println();
	}

	private double calculatorTotalTime(List<TimeSet> list) {

		double totalMinutes = 0;
		for (TimeSet timeSet : list) {
			totalMinutes += timeSet.termTime();
		}
		return totalMinutes;
	}

	/**
	 * 가중치 계산
	 * @param date 기준 날짜
	 * @param timeSetList
	 * @param isHoliday
	 * @param isAlternativeHoliday 대체 휴일 여부
	 */
	public Map<String, Double> calcWeightWorkTime(LocalDate date, Map<String, List<TimeSet>> map, boolean isHoliday, boolean isAlternativeHoliday) {

		boolean isPrint = false;

		if(date.isEqual(LocalDate.of(date.getYear(), 5, 1))) {
			isAlternativeHoliday = false;	// 근로자의 날(5월 1일)은 대체휴무가 적용 안됨(원격지원으로 처리)
		}

		List<TimeSet> workTimeList = map.get("workTimeList");
		List<TimeSet> holidayTimeList = map.get("holidayTimeList");
		List<TimeSet> restTimeList = map.get("restTimeList");
		List<TimeSet> overTimeList = map.get("overTimeList");
		List<TimeSet> nightTimeList = map.get("nightTimeList");

		double workTimeTotalMinutes = 0;		// 전체 소정 근로시간(분)
		double holidayWorkTimeTotalMinutes = 0; // 전체 휴일 근로시간(분)
		double restTimeTotalMinutes = 0;		// 전체 휴계시간(분)
		double overTimeTotalMinutes = 0; 		// 전체 연장 근로시간(분)
		double nightTimeTotalMinutes = 0; 		// 전체 야간 근로시간(분)

		if(!isHoliday) {	// 소정 근로시간 

			workTimeTotalMinutes = this.calculatorTotalTime(workTimeList);
			if(isPrint) {

				System.out.println("== 소정 근로시간 ==");
				this.printWorkTime(workTimeList);
				System.out.println("총 소정 근로시간 : " + workTimeTotalMinutes + " (minutes)");
				System.out.println();
			}
		} else {	// 휴일 근로시간 

			holidayWorkTimeTotalMinutes = this.calculatorTotalTime(holidayTimeList);
			if(isPrint) {

				System.out.println("== 휴일 근로시간 ==");
				this.printWorkTime(holidayTimeList);
				System.out.println("총 휴일근로 : " + holidayWorkTimeTotalMinutes + " (minutes)");
				System.out.println();
			}
		}

		// 휴계시간 
		restTimeTotalMinutes = this.calculatorTotalTime(restTimeList);
		if(isPrint) {

			System.out.println("== 휴계시간 ==");
			this.printWorkTime(restTimeList);
			System.out.println("총 휴계시간 : " + restTimeTotalMinutes + " (minutes)");
			System.out.println();
		}

		// 연장근로시간 (8시간 이상)
		overTimeTotalMinutes = this.calculatorTotalTime(overTimeList);
		if(isPrint) {

			System.out.println("== 연장근로 시간 ==");
			this.printWorkTime(overTimeList);
			System.out.println("총 연장근로 : " + overTimeTotalMinutes + " (minutes)");
			System.out.println();
		}

		// 야간 근로시간 (22시 ~ 6시)
		nightTimeTotalMinutes = this.calculatorTotalTime(nightTimeList);
		if(isPrint) {

			System.out.println("== 야간근로 시간 ==");
			this.printWorkTime(nightTimeList);
			System.out.println("총 야간근로 : " + nightTimeTotalMinutes + " (minutes)");
			System.out.println();
		}

		// 가중치 계산 시작 
		if(isPrint) {
			System.out.println("== 가중치 계산 ==");
		}

		// 연장 근로시간
		double weightOverTimeTotalMinutes = overTimeTotalMinutes * this.OVERTIME_WEIGHT;	// 가중치 연장 근로시간(분)
		if(isHoliday) {
			weightOverTimeTotalMinutes = overTimeTotalMinutes * this.HOLIDAY_OVERTIME_WEIGHT;
		}

		if(isPrint) {
			System.out.println("연장 근로시간: " + (overTimeTotalMinutes/60) + "(hour) / " + overTimeTotalMinutes + " (minutes)" + "\t\t" + "가중치 계산 시간: " + (weightOverTimeTotalMinutes/60) + " (hour) / " + weightOverTimeTotalMinutes + " (minutes)");
		}

		// 야간 근로시간
		double weightNightTimeTotalMinutes = nightTimeTotalMinutes * this.NIGHTTIME_WEIGHT;
		if(isPrint) {
			System.out.println("야간 근로시간: " + (nightTimeTotalMinutes/60) + "(hour) / " + nightTimeTotalMinutes + " (minutes)" + "\t\t" + "가중치 계산 시간: " + (weightNightTimeTotalMinutes/60) + " (hour) / " + weightNightTimeTotalMinutes + " (minutes)");
		}

		double weightWorkTimeTotalMinutes = workTimeTotalMinutes * this.WORKTIME_WEIGHT;	// 가중치 소정 근로시간(분)
		double weightHolidayWorkTimeTotalMinutes = 0;	// 가중치 휴일 근로시간(분)

		if(!isHoliday) {

			if(isPrint) {
				System.out.println("소정 근로시간: " + (workTimeTotalMinutes/60) + "(hour) / " + workTimeTotalMinutes + " (minutes)" + "\t\t" + "가중치 계산 시간: " + (weightWorkTimeTotalMinutes/60) + " (hour) / " + weightWorkTimeTotalMinutes + " (minutes)");
			}
		} else {

			if(isAlternativeHoliday) {

				// '방문지원'일 경우 
				weightHolidayWorkTimeTotalMinutes = 480;	// 대체휴일일 경우 8시간으로 인정
				if(isPrint) {
					System.out.println("휴일 근로시간(대체휴무): " + (holidayWorkTimeTotalMinutes/60) + "(hour) / " + holidayWorkTimeTotalMinutes + " (minutes)" + "\t\t" + "가중치 계산 시간: " + (weightHolidayWorkTimeTotalMinutes/60) + " (hour) / " + weightHolidayWorkTimeTotalMinutes + " (minutes)");
				}
			} else {

				// '원격지원'일 경우 
				weightHolidayWorkTimeTotalMinutes = holidayWorkTimeTotalMinutes * this.HOLIDAY_WEIGHT;
				if(isPrint) {
					System.out.println("휴일 근로시간: " + (holidayWorkTimeTotalMinutes/60) + "(hour) / " + holidayWorkTimeTotalMinutes + " (minutes)" + "\t\t" + "가중치 계산 시간: " + (weightHolidayWorkTimeTotalMinutes/60) + " (hour) / " + weightHolidayWorkTimeTotalMinutes + " (minutes)");
				}
			}
		}

		double weightTotalTime = weightWorkTimeTotalMinutes + weightHolidayWorkTimeTotalMinutes + weightOverTimeTotalMinutes + weightNightTimeTotalMinutes;
		if(isPrint) {

			System.out.println("합계 근로시간(가중치 계산): " + (weightTotalTime/60) + " (hour) / " + weightTotalTime + " (minutes)");
			System.out.println();
			System.out.println();
		}

//		double weight_compensation_total_time = weightWorkTimeTotalMinutes + weightHolidayWorkTimeTotalMinutes + weightOverTimeTotalMinutes + weightNightTimeTotalMinutes - (8 * 60);
//		double weight_compensation_total_time = weightOverTimeTotalMinutes + weightNightTimeTotalMinutes;
		double weight_compensation_total_time = 0;
		if(weightHolidayWorkTimeTotalMinutes > 0) {
			weight_compensation_total_time = weightHolidayWorkTimeTotalMinutes;
		} else {
			weight_compensation_total_time = weightOverTimeTotalMinutes + weightNightTimeTotalMinutes;
		}

		if(isPrint) {

			System.out.println("합계 보상시간(가중치 계산): " + (weight_compensation_total_time/60) + " (hour) / " + weight_compensation_total_time + " (minutes)");
			System.out.println();
			System.out.println();
		}

		// 총시간
		double sumWorkTime = workTimeTotalMinutes + holidayWorkTimeTotalMinutes + restTimeTotalMinutes;
		if(isPrint) {
			System.out.println("총시간: " + (sumWorkTime/60) + "(hour) / " + sumWorkTime + " (minutes)");
		}

		// 총시간(휴계시간 제외)
		double calcSumWorkTime = workTimeTotalMinutes + holidayWorkTimeTotalMinutes;
		if(isPrint) {
			System.out.println("총시간(휴계시간 제외): " + (calcSumWorkTime/60) + "(hour) / " + calcSumWorkTime + " (minutes)");
		}

		Map<String, Double> returnMap = new HashMap<String, Double>();
		returnMap.put("sumWorkTime", sumWorkTime);	// 총시간 
		returnMap.put("calcSumWorkTime", calcSumWorkTime);	// 총시간(휴계시간 제외)

		returnMap.put("workTimeTotalMinutes", workTimeTotalMinutes);	//소정 근로시간 
		returnMap.put("holidayWorkTimeTotalMinutes", holidayWorkTimeTotalMinutes);	// 휴일 근로시간 
		returnMap.put("restTimeTotalMinutes", restTimeTotalMinutes);	// 휴계시간 
		returnMap.put("overTimeTotalMinutes", overTimeTotalMinutes);	// 연장 근로시간 
		returnMap.put("nightTimeTotalMinutes", nightTimeTotalMinutes);	// 야간 근로시간 

		returnMap.put("weightWorkTimeTotalMinutes", weightWorkTimeTotalMinutes);	// 소정 근로시간(가중치)
		returnMap.put("weightHolidayWorkTimeTotalMinutes", weightHolidayWorkTimeTotalMinutes);	// 휴일 근로시간(가중치)
		returnMap.put("weightOverTimeTotalMinutes", weightOverTimeTotalMinutes);	// 연장 근로시간(가중치)
		returnMap.put("weightNightTimeTotalMinutes", weightNightTimeTotalMinutes);	// 야간 근로시간(가중치)
		returnMap.put("weightTotalTime", weightTotalTime);	// 가중치 합계 근로시간 근로시간 
		returnMap.put("weight_compensation_total_time", weight_compensation_total_time);	// 가중치 보상시간 근로시간 

		return returnMap;
	}

	/**
	 * 월별 소정 근로시간 계산
	 * @param searchMonth
	 * @param count
	 * @return
	 */
	@Deprecated
	public double getMonthStandWorkTime(String searchMonth, int count) {

		YearMonth yearMonth = YearMonth.parse(searchMonth);

		int workDayCount = 0;
		for (int i = 1; i <= yearMonth.lengthOfMonth(); i++) {

			boolean isHoliday = this.holidayService.checkHoliday(yearMonth.atDay(i));
			if(!isHoliday) {
				workDayCount++;
			}
		}

		return (workDayCount * 8 * 60) * count;
	}

	/**
	 * 기간별 소정 근로시간 계산
	 * @param searchDate
	 * @param employeeCount
	 * @return
	 */
	public double getRangeDateStandWorkTime(String searchDate, int employeeCount) {

		LocalDate startDate;
		LocalDate endDate;
		String[] dates = searchDate.split("\\|");
		if(dates.length == 2) {

			startDate = LocalDate.parse(dates[0]);
			endDate = LocalDate.parse(dates[1]);

			int workDayCount = 0;
			for(int i = 0; i <= ChronoUnit.DAYS.between(startDate, endDate); i++) {

				boolean isHoliday = this.holidayService.checkHoliday(startDate.plusDays(i));
				if(!isHoliday) {
					workDayCount++;
				}
			}

			return (workDayCount * 8 * 60) * employeeCount;
		}

		return 0;
	}

	/**
	 * 기간별 평일 갯수
	 * @param searchDate
	 * @param employeeCount
	 * @return
	 */
	public int getRangeDateWorkingDay(String searchDate, int employeeCount) {

		LocalDate startDate;
		LocalDate endDate;
		String[] dates = searchDate.split("\\|");
		if(dates.length == 2) {

			startDate = LocalDate.parse(dates[0]);
			endDate = LocalDate.parse(dates[1]);

			int workDayCount = 0;
			for(int i = 0; i <= ChronoUnit.DAYS.between(startDate, endDate); i++) {

				boolean isHoliday = this.holidayService.checkHoliday(startDate.plusDays(i));
				if(!isHoliday) {
					workDayCount++;
				}
			}

			return workDayCount * employeeCount;
		}

		return 0;
	}

	/**
	 * 기간별 주 계산
	 * 한달 기준 4주로 일괄 계산
	 * @param searchDate
	 * @return
	 */
	public double getRangeDateWeekCount(String searchDate) {

		double week = 4;
		LocalDate startDate;
		LocalDate endDate;
		String[] dates = searchDate.split("\\|");
		if(dates.length == 2) {

			startDate = LocalDate.parse(dates[0]);
			endDate = LocalDate.parse(dates[1]);

			week = (ChronoUnit.MONTHS.between(startDate, endDate) + 1) * 4;
		}

		return week;
	}
}