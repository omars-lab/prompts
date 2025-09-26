## Process Overview
When tasked with generating a plantuml diagram, ensure to take the following approach: 

1. **Generate PlantUML Code**: Create clean, simple PlantUML syntax based on the description
2. **Generate URL**: Use `tool_generate_plantuml_image_url` to create the PlantUML server URL
3. **Download Diagram**: Use `tool_download_plantuml_image` to download the SVG (handles redirects automatically)
4. **Validate Content**: Check the downloaded SVG for syntax errors or issues
5. **Iterate if Needed**: If errors found, fix the PlantUML code and repeat

## AWS Icons Integration Best Practices

### Correct AWS Icons Setup
When using AWS icons in PlantUML diagrams:

1. **Use the correct base URL**: `!define AWSPuml https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/v20.0/dist`
2. **Use `!include` not `!includeurl`**: Always use `!include AWSPuml/...` for AWS icons
3. **Verify icon paths**: Check the AWS icons list below for correct include paths
4. **Common corrections**:
   - `SimpleStorageServiceS3.puml` → `AWSPuml/Storage/SimpleStorageService.puml`
   - `ArtificialIntelligence/SageMaker.puml` → `AWSPuml/Analytics/SageMaker.puml`
   - `ApplicationIntegration/APIGateway.puml` → `AWSPuml/NetworkingContentDelivery/APIGateway.puml`

### Iterative Debugging Process
When PlantUML diagrams show "Cannot open URL" errors:

1. **Read the SVG content** to identify which specific include is failing
2. **Check the AWS icons list** for the correct path
3. **Update the PlantUML code** with the correct include path
4. **Regenerate the diagram** and verify it works
5. **Save the corrected SVG** to the static directory

### Blog Post Integration
When embedding PlantUML diagrams in blog posts:

1. **Use tabbed structure** (diagram tab first, then code tab):
   ```mdx
   <Tabs>
   <TabItem value="svg" label="Rendered Diagram" default>
   ![Diagram Name](/img/diagram-name.svg)
   </TabItem>
   <TabItem value="plantuml" label="PlantUML Code">
   ```plantuml
   @startuml
   !define AWSPuml https://raw.githubusercontent.com/awslabs/aws-icons-for-plantuml/v20.0/dist
   !include AWSPuml/AWSCommon.puml
   !include AWSPuml/NetworkingContentDelivery/APIGateway.puml
   // ... rest of diagram
   @enduml
   ```
   </TabItem>
   </Tabs>
   ```

2. **Save SVGs to static directory**: `/Users/omareid/Workspace/git/projects/omars-lab.github.io/bytesofpurpose-blog/static/img/`
3. **Reference images correctly**: Use `/img/filename.svg` path in blog posts
4. **Ensure SVGs are valid**: Check that they contain actual diagrams, not error messages

### Complete Blog Post Integration Workflow
When generating PlantUML diagrams for blog posts in this repository:

1. **Generate the PlantUML code** with correct AWS icon includes
2. **Create the PlantUML URL** using the generate tool
3. **Download and validate the SVG** to ensure it's working
4. **Save the SVG to static directory**: 
   ```bash
   cp /tmp/diagram.svg /Users/omareid/Workspace/git/projects/omars-lab.github.io/bytesofpurpose-blog/static/img/diagram-name.svg
   ```
5. **Update the blog post** with tabbed structure:
   - Tab 1: PlantUML code (with corrected includes)
   - Tab 2: Image reference to static SVG
6. **Verify the blog post renders correctly** in Docusaurus

### Troubleshooting Common Issues
- **"Cannot open URL" errors**: Check AWS icon include paths against the list below
- **SVG shows error messages**: Regenerate with corrected PlantUML code
- **Images not displaying**: Verify SVG is saved to correct static directory
- **Tabbed view not working**: Ensure proper MDX syntax for `<Tabs>` and `<TabItem>`

## Key Learnings from Previous Iterations

### PlantUML Best Practices:
- Keep diagrams simple and focused
- Use proper PlantUML syntax (actor, rectangle, arrows, notes)
- Avoid complex nested structures that may cause parsing issues
- Use clear, descriptive labels and titles

### Download Process:
- The `tool_download_plantuml_image` function now handles redirects automatically (like `curl -L`)
- PlantUML URLs often redirect (301/302), so redirects must be followed
- Save files to `{os.environ.get('TMPDIR', '/tmp')}/tmp-puml.svg`
- Check file size > 0 bytes to ensure successful download

### Validation Process:
- Read the downloaded SVG file to check for syntax errors
- Look for error messages in the SVG content
- Verify the SVG contains actual diagram content, not just error text
- Check that the file size is reasonable (> 1000 bytes for a simple diagram)

### Iteration Strategy:
- If syntax errors found: Simplify the PlantUML code and try again
- If download fails: Check URL format and try alternative approaches
- If validation fails: Examine the SVG content for specific error messages
- Maximum 3 iterations to avoid infinite loops

## Expected Output
When successful, return:
- Final working PlantUML URL
- Confirmation of successful download
- Brief description of the generated diagram
- Any lessons learned during the iteration process


# AWS Icons

AWSPuml/Analytics/Analytics.puml
AWSPuml/Analytics/Athena.puml
AWSPuml/Analytics/AthenaDataSourceConnectors.puml
AWSPuml/Analytics/CleanRooms.puml
AWSPuml/Analytics/CloudSearch.puml
AWSPuml/Analytics/CloudSearchSearchDocuments.puml
AWSPuml/Analytics/DataExchange.puml
AWSPuml/Analytics/DataExchangeforAPIs.puml
AWSPuml/Analytics/DataFirehose.puml
AWSPuml/Analytics/DataZone.puml
AWSPuml/Analytics/DataZoneBusinessDataCatalog.puml
AWSPuml/Analytics/DataZoneDataPortal.puml
AWSPuml/Analytics/DataZoneDataProjects.puml
AWSPuml/Analytics/EMR.puml
AWSPuml/Analytics/EMRCluster.puml
AWSPuml/Analytics/EMREMREngine.puml
AWSPuml/Analytics/EMRHDFSCluster.puml
AWSPuml/Analytics/EntityResolution.puml
AWSPuml/Analytics/FinSpace.puml
AWSPuml/Analytics/Glue.puml
AWSPuml/Analytics/GlueAWSGlueforRay.puml
AWSPuml/Analytics/GlueCrawler.puml
AWSPuml/Analytics/GlueDataBrew.puml
AWSPuml/Analytics/GlueDataCatalog.puml
AWSPuml/Analytics/GlueDataQuality.puml
AWSPuml/Analytics/Kinesis.puml
AWSPuml/Analytics/KinesisDataStreams.puml
AWSPuml/Analytics/KinesisVideoStreams.puml
AWSPuml/Analytics/LakeFormation.puml
AWSPuml/Analytics/LakeFormationDataLake.puml
AWSPuml/Analytics/ManagedServiceforApacheFlink.puml
AWSPuml/Analytics/ManagedStreamingforApacheKafka.puml
AWSPuml/Analytics/MSKAmazonMSKConnect.puml
AWSPuml/Analytics/OpenSearchService.puml
AWSPuml/Analytics/OpenSearchServiceClusterAdministratorNode.puml
AWSPuml/Analytics/OpenSearchServiceDataNode.puml
AWSPuml/Analytics/OpenSearchServiceIndex.puml
AWSPuml/Analytics/OpenSearchServiceObservability.puml
AWSPuml/Analytics/OpenSearchServiceOpenSearchDashboards.puml
AWSPuml/Analytics/OpenSearchServiceOpenSearchIngestion.puml
AWSPuml/Analytics/OpenSearchServiceTraces.puml
AWSPuml/Analytics/OpenSearchServiceUltraWarmNode.puml
AWSPuml/Analytics/QuickSight.puml
AWSPuml/Analytics/QuicksightPaginatedReports.puml
AWSPuml/Analytics/Redshift.puml
AWSPuml/Analytics/RedshiftAutocopy.puml
AWSPuml/Analytics/RedshiftDataSharingGovernance.puml
AWSPuml/Analytics/RedshiftDenseComputeNode.puml
AWSPuml/Analytics/RedshiftDenseStorageNode.puml
AWSPuml/Analytics/RedshiftML.puml
AWSPuml/Analytics/RedshiftQueryEditorv20.puml
AWSPuml/Analytics/RedshiftRA3.puml
AWSPuml/Analytics/RedshiftStreamingIngestion.puml
AWSPuml/Analytics/SageMaker.puml
AWSPuml/ApplicationIntegration/AppFlow.puml
AWSPuml/ApplicationIntegration/ApplicationIntegration.puml
AWSPuml/ApplicationIntegration/AppSync.puml
AWSPuml/ApplicationIntegration/B2BDataInterchange.puml
AWSPuml/ApplicationIntegration/EventBridge.puml
AWSPuml/ApplicationIntegration/EventBridgeCustomEventBus.puml
AWSPuml/ApplicationIntegration/EventBridgeDefaultEventBus.puml
AWSPuml/ApplicationIntegration/EventBridgeEvent.puml
AWSPuml/ApplicationIntegration/EventBridgePipes.puml
AWSPuml/ApplicationIntegration/EventBridgeRule.puml
AWSPuml/ApplicationIntegration/EventBridgeSaasPartnerEvent.puml
AWSPuml/ApplicationIntegration/EventBridgeScheduler.puml
AWSPuml/ApplicationIntegration/EventBridgeSchema.puml
AWSPuml/ApplicationIntegration/EventBridgeSchemaRegistry.puml
AWSPuml/ApplicationIntegration/ExpressWorkflows.puml
AWSPuml/ApplicationIntegration/ManagedWorkflowsforApacheAirflow.puml
AWSPuml/ApplicationIntegration/MQ.puml
AWSPuml/ApplicationIntegration/MQBroker.puml
AWSPuml/ApplicationIntegration/SimpleNotificationService.puml
AWSPuml/ApplicationIntegration/SimpleNotificationServiceEmailNotification.puml
AWSPuml/ApplicationIntegration/SimpleNotificationServiceHTTPNotification.puml
AWSPuml/ApplicationIntegration/SimpleNotificationServiceTopic.puml
AWSPuml/ApplicationIntegration/SimpleQueueService.puml
AWSPuml/ApplicationIntegration/SimpleQueueServiceMessage.puml
AWSPuml/ApplicationIntegration/SimpleQueueServiceQueue.puml
AWSPuml/ApplicationIntegration/StepFunctions.puml
AWSPuml/ArtificialIntelligence/ApacheMXNetonAWS.puml
AWSPuml/ArtificialIntelligence/AppStudio.puml
AWSPuml/ArtificialIntelligence/ArtificialIntelligence.puml
AWSPuml/ArtificialIntelligence/AugmentedAIA2I.puml
AWSPuml/ArtificialIntelligence/Bedrock.puml
AWSPuml/ArtificialIntelligence/CodeGuru.puml
AWSPuml/ArtificialIntelligence/CodeWhisperer.puml
AWSPuml/ArtificialIntelligence/Comprehend.puml
AWSPuml/ArtificialIntelligence/ComprehendMedical.puml
AWSPuml/ArtificialIntelligence/DeepComposer.puml
AWSPuml/ArtificialIntelligence/DeepLearningAMIs.puml
AWSPuml/ArtificialIntelligence/DeepLearningContainers.puml
AWSPuml/ArtificialIntelligence/DeepLens.puml
AWSPuml/ArtificialIntelligence/DeepRacer.puml
AWSPuml/ArtificialIntelligence/DevOpsGuru.puml
AWSPuml/ArtificialIntelligence/DevOpsGuruInsights.puml
AWSPuml/ArtificialIntelligence/ElasticInference.puml
AWSPuml/ArtificialIntelligence/Forecast.puml
AWSPuml/ArtificialIntelligence/FraudDetector.puml
AWSPuml/ArtificialIntelligence/HealthImaging.puml
AWSPuml/ArtificialIntelligence/HealthLake.puml
AWSPuml/ArtificialIntelligence/HealthOmics.puml
AWSPuml/ArtificialIntelligence/HealthScribe.puml
AWSPuml/ArtificialIntelligence/Kendra.puml
AWSPuml/ArtificialIntelligence/Lex.puml
AWSPuml/ArtificialIntelligence/LookoutforEquipment.puml
AWSPuml/ArtificialIntelligence/LookoutforMetrics.puml
AWSPuml/ArtificialIntelligence/LookoutforVision.puml
AWSPuml/ArtificialIntelligence/Monitron.puml
AWSPuml/ArtificialIntelligence/Neuron.puml
AWSPuml/ArtificialIntelligence/Nova.puml
AWSPuml/ArtificialIntelligence/Panorama.puml
AWSPuml/ArtificialIntelligence/Personalize.puml
AWSPuml/ArtificialIntelligence/Polly.puml
AWSPuml/ArtificialIntelligence/PyTorchonAWS.puml
AWSPuml/ArtificialIntelligence/Q.puml
AWSPuml/ArtificialIntelligence/Rekognition.puml
AWSPuml/ArtificialIntelligence/RekognitionImage.puml
AWSPuml/ArtificialIntelligence/RekognitionVideo.puml
AWSPuml/ArtificialIntelligence/SageMakerAI.puml
AWSPuml/ArtificialIntelligence/SageMakerCanvas.puml
AWSPuml/ArtificialIntelligence/SageMakerGeospatialML.puml
AWSPuml/ArtificialIntelligence/SageMakerGroundTruth.puml
AWSPuml/ArtificialIntelligence/SageMakerModel.puml
AWSPuml/ArtificialIntelligence/SageMakerNotebook.puml
AWSPuml/ArtificialIntelligence/SageMakerShadowTesting.puml
AWSPuml/ArtificialIntelligence/SageMakerStudioLab.puml
AWSPuml/ArtificialIntelligence/SageMakerTrain.puml
AWSPuml/ArtificialIntelligence/TensorFlowonAWS.puml
AWSPuml/ArtificialIntelligence/Textract.puml
AWSPuml/ArtificialIntelligence/TextractAnalyzeLending.puml
AWSPuml/ArtificialIntelligence/Transcribe.puml
AWSPuml/ArtificialIntelligence/Translate.puml
AWSPuml/AWSC4Integration.puml
AWSPuml/AWSCommon.puml
AWSPuml/AWSExperimental.puml
AWSPuml/AWSRaw.puml
AWSPuml/AWSSimplified.puml
AWSPuml/Blockchain/Blockchain.puml
AWSPuml/Blockchain/ManagedBlockchain.puml
AWSPuml/Blockchain/ManagedBlockchainBlockchain.puml
AWSPuml/Blockchain/QuantumLedgerDatabase.puml
AWSPuml/BusinessApplications/AlexaForBusiness.puml
AWSPuml/BusinessApplications/AppFabric.puml
AWSPuml/BusinessApplications/BusinessApplications.puml
AWSPuml/BusinessApplications/Chime.puml
AWSPuml/BusinessApplications/ChimeSDK.puml
AWSPuml/BusinessApplications/Connect.puml
AWSPuml/BusinessApplications/EndUserMessaging.puml
AWSPuml/BusinessApplications/Pinpoint.puml
AWSPuml/BusinessApplications/PinpointAPIs.puml
AWSPuml/BusinessApplications/PinpointJourney.puml
AWSPuml/BusinessApplications/SimpleEmailService.puml
AWSPuml/BusinessApplications/SimpleEmailServiceEmail.puml
AWSPuml/BusinessApplications/SupplyChain.puml
AWSPuml/BusinessApplications/Wickr.puml
AWSPuml/BusinessApplications/WorkDocs.puml
AWSPuml/BusinessApplications/WorkDocsSDK.puml
AWSPuml/BusinessApplications/WorkMail.puml
AWSPuml/CloudFinancialManagement/BillingConductor.puml
AWSPuml/CloudFinancialManagement/Budgets.puml
AWSPuml/CloudFinancialManagement/CloudFinancialManagement.puml
AWSPuml/CloudFinancialManagement/CostandUsageReport.puml
AWSPuml/CloudFinancialManagement/CostExplorer.puml
AWSPuml/CloudFinancialManagement/ReservedInstanceReporting.puml
AWSPuml/CloudFinancialManagement/SavingsPlans.puml
AWSPuml/Compute/AppRunner.puml
AWSPuml/Compute/Batch.puml
AWSPuml/Compute/Bottlerocket.puml
AWSPuml/Compute/Compute.puml
AWSPuml/Compute/DCV.puml
AWSPuml/Compute/EC2.puml
AWSPuml/Compute/EC2AMI.puml
AWSPuml/Compute/EC2AutoScaling.puml
AWSPuml/Compute/EC2AutoScalingResource.puml
AWSPuml/Compute/EC2AWSMicroserviceExtractorforNET.puml
AWSPuml/Compute/EC2DBInstance.puml
AWSPuml/Compute/EC2ElasticIPAddress.puml
AWSPuml/Compute/EC2ImageBuilder.puml
AWSPuml/Compute/EC2Instance.puml
AWSPuml/Compute/EC2Instances.puml
AWSPuml/Compute/EC2InstancewithCloudWatch.puml
AWSPuml/Compute/EC2Rescue.puml
AWSPuml/Compute/EC2SpotInstance.puml
AWSPuml/Compute/ElasticBeanstalk.puml
AWSPuml/Compute/ElasticBeanstalkApplication.puml
AWSPuml/Compute/ElasticBeanstalkDeployment.puml
AWSPuml/Compute/ElasticFabricAdapter.puml
AWSPuml/Compute/Lambda.puml
AWSPuml/Compute/LambdaLambdaFunction.puml
AWSPuml/Compute/Lightsail.puml
AWSPuml/Compute/LightsailforResearch.puml
AWSPuml/Compute/LocalZones.puml
AWSPuml/Compute/NICEEnginFrame.puml
AWSPuml/Compute/NitroEnclaves.puml
AWSPuml/Compute/Outpostsfamily.puml
AWSPuml/Compute/Outpostsrack.puml
AWSPuml/Compute/Outpostsservers.puml
AWSPuml/Compute/ParallelCluster.puml
AWSPuml/Compute/ParallelComputingService.puml
AWSPuml/Compute/ServerlessApplicationRepository.puml
AWSPuml/Compute/SimSpaceWeaver.puml
AWSPuml/Compute/Wavelength.puml
AWSPuml/ContactCenter/ContactCenter.puml
AWSPuml/Containers/Containers.puml
AWSPuml/Containers/ECSAnywhere.puml
AWSPuml/Containers/EKSAnywhere.puml
AWSPuml/Containers/EKSCloud.puml
AWSPuml/Containers/EKSDistro.puml
AWSPuml/Containers/ElasticContainerRegistry.puml
AWSPuml/Containers/ElasticContainerRegistryImage.puml
AWSPuml/Containers/ElasticContainerRegistryRegistry.puml
AWSPuml/Containers/ElasticContainerService.puml
AWSPuml/Containers/ElasticContainerServiceContainer1.puml
AWSPuml/Containers/ElasticContainerServiceContainer2.puml
AWSPuml/Containers/ElasticContainerServiceContainer3.puml
AWSPuml/Containers/ElasticContainerServiceCopilotCLI.puml
AWSPuml/Containers/ElasticContainerServiceECSServiceConnect.puml
AWSPuml/Containers/ElasticContainerServiceService.puml
AWSPuml/Containers/ElasticContainerServiceTask.puml
AWSPuml/Containers/ElasticKubernetesService.puml
AWSPuml/Containers/ElasticKubernetesServiceEKSonOutposts.puml
AWSPuml/Containers/Fargate.puml
AWSPuml/Containers/RedHatOpenShiftServiceonAWS.puml
AWSPuml/CustomerEnablement/Activate.puml
AWSPuml/CustomerEnablement/CustomerEnablement.puml
AWSPuml/CustomerEnablement/IQ.puml
AWSPuml/CustomerEnablement/ManagedServices.puml
AWSPuml/CustomerEnablement/ProfessionalServices.puml
AWSPuml/CustomerEnablement/rePost.puml
AWSPuml/CustomerEnablement/rePostPrivate.puml
AWSPuml/CustomerEnablement/Support.puml
AWSPuml/CustomerEnablement/TrainingCertification.puml
AWSPuml/Database/Aurora.puml
AWSPuml/Database/AuroraAmazonAuroraInstanceAlternate.puml
AWSPuml/Database/AuroraAmazonRDSInstance.puml
AWSPuml/Database/AuroraAmazonRDSInstanceAlternate.puml
AWSPuml/Database/AuroraInstance.puml
AWSPuml/Database/AuroraMariaDBInstance.puml
AWSPuml/Database/AuroraMariaDBInstanceAlternate.puml
AWSPuml/Database/AuroraMySQLInstance.puml
AWSPuml/Database/AuroraMySQLInstanceAlternate.puml
AWSPuml/Database/AuroraOracleInstance.puml
AWSPuml/Database/AuroraOracleInstanceAlternate.puml
AWSPuml/Database/AuroraPIOPSInstance.puml
AWSPuml/Database/AuroraPostgreSQLInstance.puml
AWSPuml/Database/AuroraPostgreSQLInstanceAlternate.puml
AWSPuml/Database/AuroraSQLServerInstance.puml
AWSPuml/Database/AuroraSQLServerInstanceAlternate.puml
AWSPuml/Database/AuroraTrustedLanguageExtensionsforPostgreSQL.puml
AWSPuml/Database/Database.puml
AWSPuml/Database/DatabaseMigrationService.puml
AWSPuml/Database/DatabaseMigrationServiceDatabasemigrationworkflowjob.puml
AWSPuml/Database/DocumentDB.puml
AWSPuml/Database/DocumentDBElasticClusters.puml
AWSPuml/Database/DynamoDB.puml
AWSPuml/Database/DynamoDBAmazonDynamoDBAccelerator.puml
AWSPuml/Database/DynamoDBAttribute.puml
AWSPuml/Database/DynamoDBAttributes.puml
AWSPuml/Database/DynamoDBGlobalsecondaryindex.puml
AWSPuml/Database/DynamoDBItem.puml
AWSPuml/Database/DynamoDBItems.puml
AWSPuml/Database/DynamoDBStandardAccessTableClass.puml
AWSPuml/Database/DynamoDBStandardInfrequentAccessTableClass.puml
AWSPuml/Database/DynamoDBStream.puml
AWSPuml/Database/DynamoDBTable.puml
AWSPuml/Database/ElastiCache.puml
AWSPuml/Database/ElastiCacheCacheNode.puml
AWSPuml/Database/ElastiCacheElastiCacheforMemcached.puml
AWSPuml/Database/ElastiCacheElastiCacheforRedis.puml
AWSPuml/Database/ElastiCacheElastiCacheforValkey.puml
AWSPuml/Database/Keyspaces.puml
AWSPuml/Database/MemoryDB.puml
AWSPuml/Database/Neptune.puml
AWSPuml/Database/OracleDatabaseatAWS.puml
AWSPuml/Database/RDS.puml
AWSPuml/Database/RDSBlueGreenDeployments.puml
AWSPuml/Database/RDSMultiAZ.puml
AWSPuml/Database/RDSMultiAZDBCluster.puml
AWSPuml/Database/RDSOptimizedWrites.puml
AWSPuml/Database/RDSProxyInstance.puml
AWSPuml/Database/RDSProxyInstanceAlternate.puml
AWSPuml/Database/RDSTrustedLanguageExtensionsforPostgreSQL.puml
AWSPuml/Database/Timestream.puml
AWSPuml/DeveloperTools/Cloud9.puml
AWSPuml/DeveloperTools/Cloud9Cloud9.puml
AWSPuml/DeveloperTools/CloudControlAPI.puml
AWSPuml/DeveloperTools/CloudDevelopmentKit.puml
AWSPuml/DeveloperTools/CloudShell.puml
AWSPuml/DeveloperTools/CodeArtifact.puml
AWSPuml/DeveloperTools/CodeBuild.puml
AWSPuml/DeveloperTools/CodeCatalyst.puml
AWSPuml/DeveloperTools/CodeCommit.puml
AWSPuml/DeveloperTools/CodeDeploy.puml
AWSPuml/DeveloperTools/CodePipeline.puml
AWSPuml/DeveloperTools/CommandLineInterface.puml
AWSPuml/DeveloperTools/Corretto.puml
AWSPuml/DeveloperTools/DeveloperTools.puml
AWSPuml/DeveloperTools/FaultInjectionService.puml
AWSPuml/DeveloperTools/InfrastructureComposer.puml
AWSPuml/DeveloperTools/ToolsandSDKs.puml
AWSPuml/DeveloperTools/XRay.puml
AWSPuml/EndUserComputing/AppStream2.puml
AWSPuml/EndUserComputing/EndUserComputing.puml
AWSPuml/EndUserComputing/WorkSpacesFamily.puml
AWSPuml/EndUserComputing/WorkSpacesFamilyAmazonWorkSpaces.puml
AWSPuml/EndUserComputing/WorkSpacesFamilyAmazonWorkSpacesCore.puml
AWSPuml/EndUserComputing/WorkSpacesFamilyAmazonWorkSpacesSecureBrowser.puml
AWSPuml/FrontEndWebMobile/Amplify.puml
AWSPuml/FrontEndWebMobile/AmplifyAWSAmplifyStudio.puml
AWSPuml/FrontEndWebMobile/DeviceFarm.puml
AWSPuml/FrontEndWebMobile/FrontEndWebMobile.puml
AWSPuml/FrontEndWebMobile/LocationService.puml
AWSPuml/FrontEndWebMobile/LocationServiceGeofence.puml
AWSPuml/FrontEndWebMobile/LocationServiceMap.puml
AWSPuml/FrontEndWebMobile/LocationServicePlace.puml
AWSPuml/FrontEndWebMobile/LocationServiceRoutes.puml
AWSPuml/FrontEndWebMobile/LocationServiceTrack.puml
AWSPuml/Games/GameLift.puml
AWSPuml/Games/Games.puml
AWSPuml/Games/Open3DEngine.puml
AWSPuml/General/Alert.puml
AWSPuml/General/AuthenticatedUser.puml
AWSPuml/General/AWSManagementConsole.puml
AWSPuml/General/Camera.puml
AWSPuml/General/Chat.puml
AWSPuml/General/Client.puml
AWSPuml/General/ColdStorage.puml
AWSPuml/General/Credentials.puml
AWSPuml/General/DataStream.puml
AWSPuml/General/DataTable.puml
AWSPuml/General/Disk.puml
AWSPuml/General/Document.puml
AWSPuml/General/Documents.puml
AWSPuml/General/Email.puml
AWSPuml/General/Folder.puml
AWSPuml/General/Folders.puml
AWSPuml/General/Forums.puml
AWSPuml/General/Gear.puml
AWSPuml/General/GenericApplication.puml
AWSPuml/General/Genericdatabase.puml
AWSPuml/General/GitRepository.puml
AWSPuml/General/Globe.puml
AWSPuml/General/Internet.puml
AWSPuml/General/Internetalt1.puml
AWSPuml/General/Internetalt2.puml
AWSPuml/General/JSONScript.puml
AWSPuml/General/Logs.puml
AWSPuml/General/MagnifyingGlass.puml
AWSPuml/General/Marketplace.puml
AWSPuml/General/Metrics.puml
AWSPuml/General/Mobileclient.puml
AWSPuml/General/Multimedia.puml
AWSPuml/General/Officebuilding.puml
AWSPuml/General/ProgrammingLanguage.puml
AWSPuml/General/Question.puml
AWSPuml/General/Recover.puml
AWSPuml/General/SAMLtoken.puml
AWSPuml/General/SDK.puml
AWSPuml/General/Servers.puml
AWSPuml/General/Shield2.puml
AWSPuml/General/SourceCode.puml
AWSPuml/General/SSLpadlock.puml
AWSPuml/General/Tapestorage.puml
AWSPuml/General/Toolkit.puml
AWSPuml/General/Traditionalserver.puml
AWSPuml/General/User.puml
AWSPuml/General/Users.puml
AWSPuml/Groups/AutoScalingGroup.puml
AWSPuml/Groups/AvailabilityZone.puml
AWSPuml/Groups/AWSAccount.puml
AWSPuml/Groups/AWSCloud.puml
AWSPuml/Groups/AWSCloudAlt.puml
AWSPuml/Groups/CorporateDataCenter.puml
AWSPuml/Groups/EC2InstanceContents.puml
AWSPuml/Groups/ElasticBeanstalkContainer.puml
AWSPuml/Groups/Generic.puml
AWSPuml/Groups/GenericAlt.puml
AWSPuml/Groups/GenericBlue.puml
AWSPuml/Groups/GenericGreen.puml
AWSPuml/Groups/GenericOrange.puml
AWSPuml/Groups/GenericPink.puml
AWSPuml/Groups/GenericPurple.puml
AWSPuml/Groups/GenericRed.puml
AWSPuml/Groups/GenericTurquoise.puml
AWSPuml/Groups/IoTGreengrass.puml
AWSPuml/Groups/IoTGreengrassDeployment.puml
AWSPuml/Groups/PrivateSubnet.puml
AWSPuml/Groups/PublicSubnet.puml
AWSPuml/Groups/Region.puml
AWSPuml/Groups/SecurityGroup.puml
AWSPuml/Groups/ServerContents.puml
AWSPuml/Groups/SpotFleet.puml
AWSPuml/Groups/StepFunctionsWorkflow.puml
AWSPuml/Groups/VPC.puml
AWSPuml/InternetOfThings/FreeRTOS.puml
AWSPuml/InternetOfThings/InternetOfThings.puml
AWSPuml/InternetOfThings/IoTAction.puml
AWSPuml/InternetOfThings/IoTActuator.puml
AWSPuml/InternetOfThings/IoTAlexaEnabledDevice.puml
AWSPuml/InternetOfThings/IoTAlexaSkill.puml
AWSPuml/InternetOfThings/IoTAlexaVoiceService.puml
AWSPuml/InternetOfThings/IoTAnalytics.puml
AWSPuml/InternetOfThings/IoTAnalyticsChannel.puml
AWSPuml/InternetOfThings/IoTAnalyticsDataset.puml
AWSPuml/InternetOfThings/IoTAnalyticsDataStore.puml
AWSPuml/InternetOfThings/IoTAnalyticsNotebook.puml
AWSPuml/InternetOfThings/IoTAnalyticsPipeline.puml
AWSPuml/InternetOfThings/IoTButton.puml
AWSPuml/InternetOfThings/IoTCertificate.puml
AWSPuml/InternetOfThings/IoTCore.puml
AWSPuml/InternetOfThings/IoTCoreDeviceAdvisor.puml
AWSPuml/InternetOfThings/IoTCoreDeviceLocation.puml
AWSPuml/InternetOfThings/IoTDesiredState.puml
AWSPuml/InternetOfThings/IoTDeviceDefender.puml
AWSPuml/InternetOfThings/IoTDeviceDefenderIoTDeviceJobs.puml
AWSPuml/InternetOfThings/IoTDeviceGateway.puml
AWSPuml/InternetOfThings/IoTDeviceManagement.puml
AWSPuml/InternetOfThings/IoTDeviceManagementFleetHub.puml
AWSPuml/InternetOfThings/IoTDeviceTester.puml
AWSPuml/InternetOfThings/IoTEcho.puml
AWSPuml/InternetOfThings/IoTEvents.puml
AWSPuml/InternetOfThings/IoTExpressLink.puml
AWSPuml/InternetOfThings/IoTFireTV.puml
AWSPuml/InternetOfThings/IoTFireTVStick.puml
AWSPuml/InternetOfThings/IoTFleetWise.puml
AWSPuml/InternetOfThings/IoTGreengrass.puml
AWSPuml/InternetOfThings/IoTGreengrassArtifact.puml
AWSPuml/InternetOfThings/IoTGreengrassComponent.puml
AWSPuml/InternetOfThings/IoTGreengrassComponentMachineLearning.puml
AWSPuml/InternetOfThings/IoTGreengrassComponentNucleus.puml
AWSPuml/InternetOfThings/IoTGreengrassComponentPrivate.puml
AWSPuml/InternetOfThings/IoTGreengrassComponentPublic.puml
AWSPuml/InternetOfThings/IoTGreengrassConnector.puml
AWSPuml/InternetOfThings/IoTGreengrassInterprocessCommunication.puml
AWSPuml/InternetOfThings/IoTGreengrassProtocol.puml
AWSPuml/InternetOfThings/IoTGreengrassRecipe.puml
AWSPuml/InternetOfThings/IoTGreengrassStreamManager.puml
AWSPuml/InternetOfThings/IoTHardwareBoard.puml
AWSPuml/InternetOfThings/IoTHTTP2Protocol.puml
AWSPuml/InternetOfThings/IoTHTTPProtocol.puml
AWSPuml/InternetOfThings/IoTLambdaFunction.puml
AWSPuml/InternetOfThings/IoTLoRaWANProtocol.puml
AWSPuml/InternetOfThings/IoTMQTTProtocol.puml
AWSPuml/InternetOfThings/IoTOverAirUpdate.puml
AWSPuml/InternetOfThings/IoTPolicy.puml
AWSPuml/InternetOfThings/IoTReportedState.puml
AWSPuml/InternetOfThings/IoTRule.puml
AWSPuml/InternetOfThings/IoTSailboat.puml
AWSPuml/InternetOfThings/IoTSensor.puml
AWSPuml/InternetOfThings/IoTServo.puml
AWSPuml/InternetOfThings/IoTShadow.puml
AWSPuml/InternetOfThings/IoTSimulator.puml
AWSPuml/InternetOfThings/IoTSiteWise.puml
AWSPuml/InternetOfThings/IoTSiteWiseAsset.puml
AWSPuml/InternetOfThings/IoTSiteWiseAssetHierarchy.puml
AWSPuml/InternetOfThings/IoTSiteWiseAssetModel.puml
AWSPuml/InternetOfThings/IoTSiteWiseAssetProperties.puml
AWSPuml/InternetOfThings/IoTSiteWiseDataStreams.puml
AWSPuml/InternetOfThings/IoTThingBank.puml
AWSPuml/InternetOfThings/IoTThingBicycle.puml
AWSPuml/InternetOfThings/IoTThingCamera.puml
AWSPuml/InternetOfThings/IoTThingCar.puml
AWSPuml/InternetOfThings/IoTThingCart.puml
AWSPuml/InternetOfThings/IoTThingCoffeePot.puml
AWSPuml/InternetOfThings/IoTThingDoorLock.puml
AWSPuml/InternetOfThings/IoTThingFactory.puml
AWSPuml/InternetOfThings/IoTThingFreeRTOSDevice.puml
AWSPuml/InternetOfThings/IoTThingGeneric.puml
AWSPuml/InternetOfThings/IoTThingHouse.puml
AWSPuml/InternetOfThings/IoTThingHumiditySensor.puml
AWSPuml/InternetOfThings/IoTThingIndustrialPC.puml
AWSPuml/InternetOfThings/IoTThingLightbulb.puml
AWSPuml/InternetOfThings/IoTThingMedicalEmergency.puml
AWSPuml/InternetOfThings/IoTThingPLC.puml
AWSPuml/InternetOfThings/IoTThingPoliceEmergency.puml
AWSPuml/InternetOfThings/IoTThingRelay.puml
AWSPuml/InternetOfThings/IoTThingStacklight.puml
AWSPuml/InternetOfThings/IoTThingTemperatureHumiditySensor.puml
AWSPuml/InternetOfThings/IoTThingTemperatureSensor.puml
AWSPuml/InternetOfThings/IoTThingTemperatureVibrationSensor.puml
AWSPuml/InternetOfThings/IoTThingThermostat.puml
AWSPuml/InternetOfThings/IoTThingTravel.puml
AWSPuml/InternetOfThings/IoTThingUtility.puml
AWSPuml/InternetOfThings/IoTThingVibrationSensor.puml
AWSPuml/InternetOfThings/IoTThingWindfarm.puml
AWSPuml/InternetOfThings/IoTTopic.puml
AWSPuml/InternetOfThings/IoTTwinMaker.puml
AWSPuml/ManagementGovernance/AppConfig.puml
AWSPuml/ManagementGovernance/ApplicationAutoScaling2.puml
AWSPuml/ManagementGovernance/AutoScaling.puml
AWSPuml/ManagementGovernance/BackintAgent.puml
AWSPuml/ManagementGovernance/Chatbot.puml
AWSPuml/ManagementGovernance/CloudFormation.puml
AWSPuml/ManagementGovernance/CloudFormationChangeSet.puml
AWSPuml/ManagementGovernance/CloudFormationStack.puml
AWSPuml/ManagementGovernance/CloudFormationTemplate.puml
AWSPuml/ManagementGovernance/CloudTrail.puml
AWSPuml/ManagementGovernance/CloudTrailCloudTrailLake.puml
AWSPuml/ManagementGovernance/CloudWatch.puml
AWSPuml/ManagementGovernance/CloudWatchAlarm.puml
AWSPuml/ManagementGovernance/CloudWatchCrossaccountObservability.puml
AWSPuml/ManagementGovernance/CloudWatchDataProtection.puml
AWSPuml/ManagementGovernance/CloudWatchEventEventBased.puml
AWSPuml/ManagementGovernance/CloudWatchEventTimeBased.puml
AWSPuml/ManagementGovernance/CloudWatchEvidently.puml
AWSPuml/ManagementGovernance/CloudWatchLogs.puml
AWSPuml/ManagementGovernance/CloudWatchMetricsInsights.puml
AWSPuml/ManagementGovernance/CloudWatchRule.puml
AWSPuml/ManagementGovernance/CloudWatchRUM.puml
AWSPuml/ManagementGovernance/CloudWatchSynthetics.puml
AWSPuml/ManagementGovernance/ComputeOptimizer.puml
AWSPuml/ManagementGovernance/Config.puml
AWSPuml/ManagementGovernance/ConsoleMobileApplication.puml
AWSPuml/ManagementGovernance/ControlTower.puml
AWSPuml/ManagementGovernance/DistroforOpenTelemetry.puml
AWSPuml/ManagementGovernance/HealthDashboard.puml
AWSPuml/ManagementGovernance/LaunchWizard.puml
AWSPuml/ManagementGovernance/LicenseManager.puml
AWSPuml/ManagementGovernance/LicenseManagerApplicationDiscovery.puml
AWSPuml/ManagementGovernance/LicenseManagerLicenseBlending.puml
AWSPuml/ManagementGovernance/ManagedGrafana.puml
AWSPuml/ManagementGovernance/ManagedServiceforPrometheus.puml
AWSPuml/ManagementGovernance/ManagementConsole.puml
AWSPuml/ManagementGovernance/ManagementGovernance.puml
AWSPuml/ManagementGovernance/Organizations.puml
AWSPuml/ManagementGovernance/OrganizationsAccount.puml
AWSPuml/ManagementGovernance/OrganizationsManagementAccount.puml
AWSPuml/ManagementGovernance/OrganizationsOrganizationalUnit.puml
AWSPuml/ManagementGovernance/Proton.puml
AWSPuml/ManagementGovernance/ResilienceHub.puml
AWSPuml/ManagementGovernance/ResourceExplorer.puml
AWSPuml/ManagementGovernance/ServiceCatalog.puml
AWSPuml/ManagementGovernance/ServiceManagementConnector.puml
AWSPuml/ManagementGovernance/SystemsManager.puml
AWSPuml/ManagementGovernance/SystemsManagerApplicationManager.puml
AWSPuml/ManagementGovernance/SystemsManagerAutomation.puml
AWSPuml/ManagementGovernance/SystemsManagerChangeCalendar.puml
AWSPuml/ManagementGovernance/SystemsManagerChangeManager.puml
AWSPuml/ManagementGovernance/SystemsManagerCompliance.puml
AWSPuml/ManagementGovernance/SystemsManagerDistributor.puml
AWSPuml/ManagementGovernance/SystemsManagerDocuments.puml
AWSPuml/ManagementGovernance/SystemsManagerIncidentManager.puml
AWSPuml/ManagementGovernance/SystemsManagerInventory.puml
AWSPuml/ManagementGovernance/SystemsManagerMaintenanceWindows.puml
AWSPuml/ManagementGovernance/SystemsManagerOpsCenter.puml
AWSPuml/ManagementGovernance/SystemsManagerParameterStore.puml
AWSPuml/ManagementGovernance/SystemsManagerPatchManager.puml
AWSPuml/ManagementGovernance/SystemsManagerRunCommand.puml
AWSPuml/ManagementGovernance/SystemsManagerSessionManager.puml
AWSPuml/ManagementGovernance/SystemsManagerStateManager.puml
AWSPuml/ManagementGovernance/TelcoNetworkBuilder.puml
AWSPuml/ManagementGovernance/TrustedAdvisor.puml
AWSPuml/ManagementGovernance/TrustedAdvisorChecklist.puml
AWSPuml/ManagementGovernance/TrustedAdvisorChecklistCost.puml
AWSPuml/ManagementGovernance/TrustedAdvisorChecklistFaultTolerant.puml
AWSPuml/ManagementGovernance/TrustedAdvisorChecklistPerformance.puml
AWSPuml/ManagementGovernance/TrustedAdvisorChecklistSecurity.puml
AWSPuml/ManagementGovernance/UserNotifications.puml
AWSPuml/ManagementGovernance/WellArchitectedTool.puml
AWSPuml/MediaServices/CloudDigitalInterface.puml
AWSPuml/MediaServices/DeadlineCloud.puml
AWSPuml/MediaServices/ElasticTranscoder.puml
AWSPuml/MediaServices/ElementalAppliancesSoftware.puml
AWSPuml/MediaServices/ElementalConductor.puml
AWSPuml/MediaServices/ElementalDelta.puml
AWSPuml/MediaServices/ElementalLink.puml
AWSPuml/MediaServices/ElementalLive.puml
AWSPuml/MediaServices/ElementalMediaConnect.puml
AWSPuml/MediaServices/ElementalMediaConnectMediaConnectGateway.puml
AWSPuml/MediaServices/ElementalMediaConvert.puml
AWSPuml/MediaServices/ElementalMediaLive.puml
AWSPuml/MediaServices/ElementalMediaPackage.puml
AWSPuml/MediaServices/ElementalMediaStore.puml
AWSPuml/MediaServices/ElementalMediaTailor.puml
AWSPuml/MediaServices/ElementalServer.puml
AWSPuml/MediaServices/InteractiveVideoService.puml
AWSPuml/MediaServices/KinesisVideoStreams2.puml
AWSPuml/MediaServices/MediaServices.puml
AWSPuml/MediaServices/ThinkboxDeadline.puml
AWSPuml/MediaServices/ThinkboxFrost.puml
AWSPuml/MediaServices/ThinkboxKrakatoa.puml
AWSPuml/MediaServices/ThinkboxSequoia.puml
AWSPuml/MediaServices/ThinkboxStoke.puml
AWSPuml/MediaServices/ThinkboxXMesh.puml
AWSPuml/MigrationModernization/ApplicationDiscoveryService.puml
AWSPuml/MigrationModernization/ApplicationDiscoveryServiceAWSAgentlessCollector.puml
AWSPuml/MigrationModernization/ApplicationDiscoveryServiceAWSDiscoveryAgent.puml
AWSPuml/MigrationModernization/ApplicationDiscoveryServiceMigrationEvaluatorCollector.puml
AWSPuml/MigrationModernization/ApplicationMigrationService.puml
AWSPuml/MigrationModernization/DataSync.puml
AWSPuml/MigrationModernization/DatasyncAgent.puml
AWSPuml/MigrationModernization/DataSyncDiscovery.puml
AWSPuml/MigrationModernization/DataTransferTerminal.puml
AWSPuml/MigrationModernization/ElasticVMwareService.puml
AWSPuml/MigrationModernization/MainframeModernization.puml
AWSPuml/MigrationModernization/MainframeModernizationAnalyzer.puml
AWSPuml/MigrationModernization/MainframeModernizationCompiler.puml
AWSPuml/MigrationModernization/MainframeModernizationConverter.puml
AWSPuml/MigrationModernization/MainframeModernizationDeveloper.puml
AWSPuml/MigrationModernization/MainframeModernizationRuntime.puml
AWSPuml/MigrationModernization/MigrationEvaluator.puml
AWSPuml/MigrationModernization/MigrationHub.puml
AWSPuml/MigrationModernization/MigrationHubRefactorSpacesApplications.puml
AWSPuml/MigrationModernization/MigrationHubRefactorSpacesEnvironments.puml
AWSPuml/MigrationModernization/MigrationHubRefactorSpacesServices.puml
AWSPuml/MigrationModernization/MigrationModernization.puml
AWSPuml/MigrationModernization/TransferFamily.puml
AWSPuml/MigrationModernization/TransferFamilyAWSAS2.puml
AWSPuml/MigrationModernization/TransferFamilyAWSFTP.puml
AWSPuml/MigrationModernization/TransferFamilyAWSFTPS.puml
AWSPuml/MigrationModernization/TransferFamilyAWSSFTP.puml
AWSPuml/NetworkingContentDelivery/APIGateway.puml
AWSPuml/NetworkingContentDelivery/APIGatewayEndpoint.puml
AWSPuml/NetworkingContentDelivery/ApplicationRecoveryController.puml
AWSPuml/NetworkingContentDelivery/AppMesh.puml
AWSPuml/NetworkingContentDelivery/AppMeshMesh.puml
AWSPuml/NetworkingContentDelivery/AppMeshVirtualGateway.puml
AWSPuml/NetworkingContentDelivery/AppMeshVirtualNode.puml
AWSPuml/NetworkingContentDelivery/AppMeshVirtualRouter.puml
AWSPuml/NetworkingContentDelivery/AppMeshVirtualService.puml
AWSPuml/NetworkingContentDelivery/ClientVPN.puml
AWSPuml/NetworkingContentDelivery/CloudFront.puml
AWSPuml/NetworkingContentDelivery/CloudFrontDownloadDistribution.puml
AWSPuml/NetworkingContentDelivery/CloudFrontEdgeLocation.puml
AWSPuml/NetworkingContentDelivery/CloudFrontFunctions.puml
AWSPuml/NetworkingContentDelivery/CloudFrontStreamingDistribution.puml
AWSPuml/NetworkingContentDelivery/CloudMap.puml
AWSPuml/NetworkingContentDelivery/CloudMapNamespace.puml
AWSPuml/NetworkingContentDelivery/CloudMapResource.puml
AWSPuml/NetworkingContentDelivery/CloudMapService.puml
AWSPuml/NetworkingContentDelivery/CloudWAN.puml
AWSPuml/NetworkingContentDelivery/CloudWANCoreNetworkEdge.puml
AWSPuml/NetworkingContentDelivery/CloudWANSegmentNetwork.puml
AWSPuml/NetworkingContentDelivery/CloudWANTransitGatewayRouteTableAttachment.puml
AWSPuml/NetworkingContentDelivery/DirectConnect.puml
AWSPuml/NetworkingContentDelivery/DirectConnectGateway.puml
AWSPuml/NetworkingContentDelivery/ElasticLoadBalancing.puml
AWSPuml/NetworkingContentDelivery/ElasticLoadBalancingApplicationLoadBalancer.puml
AWSPuml/NetworkingContentDelivery/ElasticLoadBalancingClassicLoadBalancer.puml
AWSPuml/NetworkingContentDelivery/ElasticLoadBalancingGatewayLoadBalancer.puml
AWSPuml/NetworkingContentDelivery/ElasticLoadBalancingNetworkLoadBalancer.puml
AWSPuml/NetworkingContentDelivery/GlobalAccelerator.puml
AWSPuml/NetworkingContentDelivery/NetworkingContentDelivery.puml
AWSPuml/NetworkingContentDelivery/Private5G.puml
AWSPuml/NetworkingContentDelivery/PrivateLink.puml
AWSPuml/NetworkingContentDelivery/Route53.puml
AWSPuml/NetworkingContentDelivery/Route53HostedZone.puml
AWSPuml/NetworkingContentDelivery/Route53ReadinessChecks.puml
AWSPuml/NetworkingContentDelivery/Route53Resolver.puml
AWSPuml/NetworkingContentDelivery/Route53ResolverQueryLogging.puml
AWSPuml/NetworkingContentDelivery/Route53RouteTable.puml
AWSPuml/NetworkingContentDelivery/Route53RoutingControls.puml
AWSPuml/NetworkingContentDelivery/SitetoSiteVPN.puml
AWSPuml/NetworkingContentDelivery/TransitGateway.puml
AWSPuml/NetworkingContentDelivery/TransitGatewayAttachment.puml
AWSPuml/NetworkingContentDelivery/VerifiedAccess.puml
AWSPuml/NetworkingContentDelivery/VirtualPrivateCloud.puml
AWSPuml/NetworkingContentDelivery/VPCCarrierGateway.puml
AWSPuml/NetworkingContentDelivery/VPCCustomerGateway.puml
AWSPuml/NetworkingContentDelivery/VPCElasticNetworkAdapter.puml
AWSPuml/NetworkingContentDelivery/VPCElasticNetworkInterface.puml
AWSPuml/NetworkingContentDelivery/VPCEndpoints.puml
AWSPuml/NetworkingContentDelivery/VPCFlowLogs.puml
AWSPuml/NetworkingContentDelivery/VPCInternetGateway.puml
AWSPuml/NetworkingContentDelivery/VPCLattice.puml
AWSPuml/NetworkingContentDelivery/VPCNATGateway.puml
AWSPuml/NetworkingContentDelivery/VPCNetworkAccessAnalyzer.puml
AWSPuml/NetworkingContentDelivery/VPCNetworkAccessControlList.puml
AWSPuml/NetworkingContentDelivery/VPCPeeringConnection.puml
AWSPuml/NetworkingContentDelivery/VPCReachabilityAnalyzer.puml
AWSPuml/NetworkingContentDelivery/VPCRouter.puml
AWSPuml/NetworkingContentDelivery/VPCTrafficMirroring.puml
AWSPuml/NetworkingContentDelivery/VPCVirtualprivatecloudVPC.puml
AWSPuml/NetworkingContentDelivery/VPCVPNConnection.puml
AWSPuml/NetworkingContentDelivery/VPCVPNGateway.puml
AWSPuml/QuantumTechnologies/Braket.puml
AWSPuml/QuantumTechnologies/BraketChandelier.puml
AWSPuml/QuantumTechnologies/BraketChip.puml
AWSPuml/QuantumTechnologies/BraketEmbeddedSimulator.puml
AWSPuml/QuantumTechnologies/BraketManagedSimulator.puml
AWSPuml/QuantumTechnologies/BraketNoiseSimulator.puml
AWSPuml/QuantumTechnologies/BraketQPU.puml
AWSPuml/QuantumTechnologies/BraketSimulator.puml
AWSPuml/QuantumTechnologies/BraketSimulator1.puml
AWSPuml/QuantumTechnologies/BraketSimulator2.puml
AWSPuml/QuantumTechnologies/BraketSimulator3.puml
AWSPuml/QuantumTechnologies/BraketSimulator4.puml
AWSPuml/QuantumTechnologies/BraketStateVector.puml
AWSPuml/QuantumTechnologies/BraketTensorNetwork.puml
AWSPuml/QuantumTechnologies/QuantumTechnologies.puml
AWSPuml/Robotics/RoboMaker.puml
AWSPuml/Robotics/RoboMakerCloudExtensionsROS.puml
AWSPuml/Robotics/RoboMakerDevelopmentEnvironment.puml
AWSPuml/Robotics/RoboMakerFleetManagement.puml
AWSPuml/Robotics/RoboMakerSimulation.puml
AWSPuml/Robotics/Robotics.puml
AWSPuml/Satellite/GroundStation.puml
AWSPuml/Satellite/Satellite.puml
AWSPuml/SecurityIdentityCompliance/Artifact.puml
AWSPuml/SecurityIdentityCompliance/AuditManager.puml
AWSPuml/SecurityIdentityCompliance/CertificateManager.puml
AWSPuml/SecurityIdentityCompliance/CertificateManagerCertificateAuthority.puml
AWSPuml/SecurityIdentityCompliance/CloudDirectory.puml
AWSPuml/SecurityIdentityCompliance/CloudHSM.puml
AWSPuml/SecurityIdentityCompliance/Cognito.puml
AWSPuml/SecurityIdentityCompliance/Detective.puml
AWSPuml/SecurityIdentityCompliance/DirectoryService.puml
AWSPuml/SecurityIdentityCompliance/DirectoryServiceADConnector.puml
AWSPuml/SecurityIdentityCompliance/DirectoryServiceAWSManagedMicrosoftAD.puml
AWSPuml/SecurityIdentityCompliance/DirectoryServiceSimpleAD.puml
AWSPuml/SecurityIdentityCompliance/FirewallManager.puml
AWSPuml/SecurityIdentityCompliance/GuardDuty.puml
AWSPuml/SecurityIdentityCompliance/IAMIdentityCenter.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementAddon.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementAWSSTS.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementAWSSTSAlternate.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementDataEncryptionKey.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementEncryptedData.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementIAMAccessAnalyzer.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementIAMRolesAnywhere.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementLongTermSecurityCredential.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementMFAToken.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementPermissions.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementRole.puml
AWSPuml/SecurityIdentityCompliance/IdentityAccessManagementTemporarySecurityCredential.puml
AWSPuml/SecurityIdentityCompliance/IdentityandAccessManagement.puml
AWSPuml/SecurityIdentityCompliance/Inspector.puml
AWSPuml/SecurityIdentityCompliance/InspectorAgent.puml
AWSPuml/SecurityIdentityCompliance/KeyManagementService.puml
AWSPuml/SecurityIdentityCompliance/KeyManagementServiceExternalKeyStore.puml
AWSPuml/SecurityIdentityCompliance/Macie.puml
AWSPuml/SecurityIdentityCompliance/NetworkFirewallEndpoints.puml
AWSPuml/SecurityIdentityCompliance/PaymentCryptography.puml
AWSPuml/SecurityIdentityCompliance/PrivateCertificateAuthority.puml
AWSPuml/SecurityIdentityCompliance/ResourceAccessManager.puml
AWSPuml/SecurityIdentityCompliance/SecretsManager.puml
AWSPuml/SecurityIdentityCompliance/SecurityHub.puml
AWSPuml/SecurityIdentityCompliance/SecurityHubFinding.puml
AWSPuml/SecurityIdentityCompliance/SecurityIdentityCompliance.puml
AWSPuml/SecurityIdentityCompliance/SecurityIncidentResponse.puml
AWSPuml/SecurityIdentityCompliance/SecurityLake.puml
AWSPuml/SecurityIdentityCompliance/Shield.puml
AWSPuml/SecurityIdentityCompliance/ShieldAWSShieldAdvanced.puml
AWSPuml/SecurityIdentityCompliance/Signer.puml
AWSPuml/SecurityIdentityCompliance/VerifiedPermissions.puml
AWSPuml/SecurityIdentityCompliance/WAF.puml
AWSPuml/SecurityIdentityCompliance/WAFBadBot.puml
AWSPuml/SecurityIdentityCompliance/WAFBot.puml
AWSPuml/SecurityIdentityCompliance/WAFBotControl.puml
AWSPuml/SecurityIdentityCompliance/WAFFilteringRule.puml
AWSPuml/SecurityIdentityCompliance/WAFLabels.puml
AWSPuml/SecurityIdentityCompliance/WAFManagedRule.puml
AWSPuml/SecurityIdentityCompliance/WAFRule.puml
AWSPuml/Serverless/Serverless.puml
AWSPuml/Storage/Backup.puml
AWSPuml/Storage/BackupAuditManager.puml
AWSPuml/Storage/BackupAWSBackupforAWSCloudFormation.puml
AWSPuml/Storage/BackupAWSBackupsupportforAmazonFSxforNetAppONTAP.puml
AWSPuml/Storage/BackupAWSBackupsupportforAmazonS3.puml
AWSPuml/Storage/BackupAWSBackupsupportforVMwareWorkloads.puml
AWSPuml/Storage/BackupBackupPlan.puml
AWSPuml/Storage/BackupBackupRestore.puml
AWSPuml/Storage/BackupBackupVault.puml
AWSPuml/Storage/BackupComplianceReporting.puml
AWSPuml/Storage/BackupCompute.puml
AWSPuml/Storage/BackupDatabase.puml
AWSPuml/Storage/BackupGateway.puml
AWSPuml/Storage/BackupLegalHold.puml
AWSPuml/Storage/BackupRecoveryPointObjective.puml
AWSPuml/Storage/BackupRecoveryTimeObjective.puml
AWSPuml/Storage/BackupStorage.puml
AWSPuml/Storage/BackupVaultLock.puml
AWSPuml/Storage/BackupVirtualMachine.puml
AWSPuml/Storage/BackupVirtualMachineMonitor.puml
AWSPuml/Storage/EFS.puml
AWSPuml/Storage/ElasticBlockStore.puml
AWSPuml/Storage/ElasticBlockStoreAmazonDataLifecycleManager.puml
AWSPuml/Storage/ElasticBlockStoreMultipleVolumes.puml
AWSPuml/Storage/ElasticBlockStoreSnapshot.puml
AWSPuml/Storage/ElasticBlockStoreVolume.puml
AWSPuml/Storage/ElasticBlockStoreVolumegp3.puml
AWSPuml/Storage/ElasticDisasterRecovery.puml
AWSPuml/Storage/ElasticFileSystemElasticThroughput.puml
AWSPuml/Storage/ElasticFileSystemFileSystem.puml
AWSPuml/Storage/ElasticFileSystemIntelligentTiering.puml
AWSPuml/Storage/ElasticFileSystemOneZone.puml
AWSPuml/Storage/ElasticFileSystemOneZoneInfrequentAccess.puml
AWSPuml/Storage/ElasticFileSystemStandard.puml
AWSPuml/Storage/ElasticFileSystemStandardInfrequentAccess.puml
AWSPuml/Storage/FileCache.puml
AWSPuml/Storage/FileCacheHybridNFSlinkeddatasets.puml
AWSPuml/Storage/FileCacheOnpremisesNFSlinkeddatasets.puml
AWSPuml/Storage/FileCacheS3linkeddatasets.puml
AWSPuml/Storage/FSx.puml
AWSPuml/Storage/FSxforLustre.puml
AWSPuml/Storage/FSxforNetAppONTAP.puml
AWSPuml/Storage/FSxforOpenZFS.puml
AWSPuml/Storage/FSxforWFS.puml
AWSPuml/Storage/S3onOutposts.puml
AWSPuml/Storage/SimpleStorageService.puml
AWSPuml/Storage/SimpleStorageServiceBucket.puml
AWSPuml/Storage/SimpleStorageServiceBucketWithObjects.puml
AWSPuml/Storage/SimpleStorageServiceDirectoryBucket.puml
AWSPuml/Storage/SimpleStorageServiceGeneralAccessPoints.puml
AWSPuml/Storage/SimpleStorageServiceGlacier.puml
AWSPuml/Storage/SimpleStorageServiceGlacierArchive.puml
AWSPuml/Storage/SimpleStorageServiceGlacierVault.puml
AWSPuml/Storage/SimpleStorageServiceObject.puml
AWSPuml/Storage/SimpleStorageServiceS3BatchOperations.puml
AWSPuml/Storage/SimpleStorageServiceS3ExpressOneZone.puml
AWSPuml/Storage/SimpleStorageServiceS3GlacierDeepArchive.puml
AWSPuml/Storage/SimpleStorageServiceS3GlacierFlexibleRetrieval.puml
AWSPuml/Storage/SimpleStorageServiceS3GlacierInstantRetrieval.puml
AWSPuml/Storage/SimpleStorageServiceS3IntelligentTiering.puml
AWSPuml/Storage/SimpleStorageServiceS3MultiRegionAccessPoints.puml
AWSPuml/Storage/SimpleStorageServiceS3ObjectLambda.puml
AWSPuml/Storage/SimpleStorageServiceS3ObjectLambdaAccessPoints.puml
AWSPuml/Storage/SimpleStorageServiceS3ObjectLock.puml
AWSPuml/Storage/SimpleStorageServiceS3OneZoneIA.puml
AWSPuml/Storage/SimpleStorageServiceS3OnOutposts.puml
AWSPuml/Storage/SimpleStorageServiceS3Replication.puml
AWSPuml/Storage/SimpleStorageServiceS3ReplicationTimeControl.puml
AWSPuml/Storage/SimpleStorageServiceS3Select.puml
AWSPuml/Storage/SimpleStorageServiceS3Standard.puml
AWSPuml/Storage/SimpleStorageServiceS3StandardIA.puml
AWSPuml/Storage/SimpleStorageServiceS3StorageLens.puml
AWSPuml/Storage/SimpleStorageServiceS3Tables.puml
AWSPuml/Storage/SimpleStorageServiceVPCAccessPoints.puml
AWSPuml/Storage/SnowballEdge.puml
AWSPuml/Storage/SnowballSnowballImportExport.puml
AWSPuml/Storage/Storage.puml
AWSPuml/Storage/StorageGateway.puml
AWSPuml/Storage/StorageGatewayAmazonFSxFileGateway.puml
AWSPuml/Storage/StorageGatewayAmazonS3FileGateway.puml
AWSPuml/Storage/StorageGatewayCachedVolume.puml
AWSPuml/Storage/StorageGatewayFileGateway.puml
AWSPuml/Storage/StorageGatewayNoncachedVolume.puml
AWSPuml/Storage/StorageGatewayTapeGateway.puml
AWSPuml/Storage/StorageGatewayVirtualTapeLibrary.puml
AWSPuml/Storage/StorageGatewayVolumeGateway.puml
