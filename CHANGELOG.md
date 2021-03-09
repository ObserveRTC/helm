All notable changes to this project will be documented in this file.

## Chart Version: 2.0.0 

### Added
 * New configuration schema to the observer
 * New configuration schema to the connector
 * Kafka Statefulset and Service for single deployment
 * Zookeeper Statefulset and Service for single deployment

### Removed
 * Separated pipelines configuration for the connector in separated files
  
## Chart Version: 1.0.1 

### Fixed
* Connector was missing default configuration for micronaut

## Chart Version 1.0.0

This was the first version of the helm chart can be used to deploy 
the solution in kubernetes.

### Added
 * Observer Statefulset, and service
 * Connector deployment and service