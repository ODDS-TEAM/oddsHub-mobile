class AppConfigs {
  bool isTrainer;

  AppConfigs({bool? overrideIsTrainer})
      : isTrainer = overrideIsTrainer ??
            const bool.fromEnvironment('IS_TRAINER', defaultValue: false);
}
