// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "http://localhost:9090/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    #
    # + return - Created 
    resource isolated function post addTeacher(TeacherRecord payload) returns string|error {
        string resourcePath = string `/addTeacher`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getAllTeachers() returns TeacherRecord[]|error {
        string resourcePath = string `/getAllTeachers`;
        TeacherRecord[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function put updateTeacher(string employeeId, TeacherRecord payload) returns string|error {
        string resourcePath = string `/updateTeacher`;
        map<anydata> queryParam = {"employeeId": employeeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getTeacherByEmployeeId(string employeeId) returns TeacherRecord|error {
        string resourcePath = string `/getTeacherByEmployeeId`;
        map<anydata> queryParam = {"employeeId": employeeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeacherRecord response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function delete deleteTeacherByEmployeeId(string employeeId) returns string|error {
        string resourcePath = string `/deleteTeacherByEmployeeId`;
        map<anydata> queryParam = {"employeeId": employeeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getTeachersInSameOffice(string officeNumber) returns TeacherRecord[]|error {
        string resourcePath = string `/getTeachersInSameOffice`;
        map<anydata> queryParam = {"officeNumber": officeNumber};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeacherRecord[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - Ok 
    resource isolated function get getTeachersTeachingCourse(string courseName) returns TeacherRecord[]|error {
        string resourcePath = string `/getTeachersTeachingCourse`;
        map<anydata> queryParam = {"courseName": courseName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeacherRecord[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}

