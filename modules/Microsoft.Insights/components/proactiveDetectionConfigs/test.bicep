module proactive 'deploy.bicep' = {
  name: 'dep_proactive'
  params: {
    appInsightName: 'skhan-appi-001'
    displayName: 'Abnormal rise in daily data volume (preview)'
    helpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
    isHidden: false
    name: 'extension_billingdatavolumedailyspikeextension'
    ruleDescription: 'testing skhan'
    ruleName: 'extension_billingdatavolumedailyspikeextension'
  }
}
