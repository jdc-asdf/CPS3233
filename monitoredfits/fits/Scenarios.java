package fits;

import rv.Verification;

public class Scenarios {

	private static Integer SCENARIO_COUNT = 32;

	static TransactionSystem transactionsystem = new TransactionSystem();

	private static void runScenario(Integer n) {
		FrontEnd frontend = transactionsystem.getFrontEnd();

		String account_number;
		Integer uid;
		Integer sid;

		if (n > 0 && n <= SCENARIO_COUNT) {
			Integer prop = (n + 1) / 2;

			System.out.println("\nRunning scenario " + n + ".");
			System.out
					.println("This scenario should " + ((n % 2 == 1) ? "" : "not ") + "violate property " + prop + ".");
		}

		frontend.ADMIN_initialise();

		switch (n) {
			case 1:
				uid = frontend.ADMIN_createUser("Fred", "France");
				frontend.ADMIN_enableUser(uid);
				sid = frontend.USER_login(uid);

				account_number = frontend.USER_requestAccount(uid, sid);
				frontend.ADMIN_approveOpenAccount(uid, account_number);
				frontend.USER_depositFromExternal(uid, sid, account_number, 100.00);

				frontend.USER_freezeUser(uid, sid);
				frontend.USER_payToExternal(uid, sid, account_number, 10.00);
				break;

			case 2:
				uid = frontend.ADMIN_createUser("Fred", "France");
				frontend.ADMIN_enableUser(uid);
				sid = frontend.USER_login(uid);
						
				account_number = frontend.USER_requestAccount(uid, sid);
				frontend.ADMIN_approveOpenAccount(uid, account_number);
				frontend.USER_depositFromExternal(uid, sid, account_number, 100.00);
						
				frontend.USER_freezeUser(uid, sid);
				frontend.USER_unfreezeUser(uid, sid);
				frontend.USER_payToExternal(uid, sid, account_number, 10.00);
				break;

		default:
			System.out.println("Requested scenario " + n.toString() + " which is not defined.");
		}
	}

	public static void runViolatingScenarioForProperty(Integer n) {
		runScenario(2 * n - 1);
	}

	public static void runNonViolatingScenarioForProperty(Integer n) {
		runScenario(2 * n);
	}

	public static void runNonScenariosForProperty(Integer n) {
		runViolatingScenarioForProperty(n);
		runNonViolatingScenarioForProperty(n);
	}

	private static void resetScenarios() {
		Verification.setupVerification();
		transactionsystem.setup();
	}

	public static void runAllScenarios() {
		for (Integer n = 1; n <= SCENARIO_COUNT; n++) {
			resetScenarios();
			runScenario(n);
		}
	}
}
