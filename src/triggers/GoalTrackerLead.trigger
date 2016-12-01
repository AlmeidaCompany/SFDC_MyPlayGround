trigger GoalTrackerLead on Lead (after insert, after update) {
	GoalTracker.goalTracker(Trigger.new);
}