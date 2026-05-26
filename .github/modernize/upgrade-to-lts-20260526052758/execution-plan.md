# Upgrade Execution Plan: Photo Album (Session 20260526053105)

- **Generated**: 2026-05-26 05:31:05
- **HEAD Branch**: copilot/execute-upgrade-plan-another-one
- **Task**: 001-upgrade-java-21 — Upgrade to Java 21

## Available Tools

**JDKs**
- JDK 1.8.0_492: /usr/lib/jvm/temurin-8-jdk-amd64/bin (current project JDK, used by Step 2)
- JDK 21.0.11: /usr/lib/jvm/temurin-21-jdk-amd64/bin (target JDK, required by Step 3+)

**Build Tools**
- Maven 3.9.16: /usr/share/apache-maven-3.9.16/bin (compatible with Java 21 ✓)
- No Maven Wrapper present

## Options

- Working branch: appmod/java-upgrade-20260526053105
- Run tests before and after the upgrade: true

## Upgrade Goals

- Java: 8 → **21**

## Technology Stack

| Technology/Dependency     | Current | Min Compatible | Why Incompatible                                   |
|---------------------------|---------|----------------|----------------------------------------------------|
| Java                      | 8       | 21             | User requested                                     |
| Spring Boot               | 2.7.18  | 2.7.18         | Already compatible with Java 21 (kept as-is)       |
| Maven                     | 3.9.16  | 3.9.0          | Already compatible ✓                               |
| maven-compiler-plugin     | 3.10.1  | 3.11.0         | 3.10.x lacks full Java 21 bytecode target support  |
| commons-io                | 2.11.0  | -              | Compatible with Java 21                            |

## Derived Upgrades

- java.version/maven.compiler.source/target → 21
- maven-compiler-plugin explicit version → 3.13.0
- Dockerfile base images → eclipse-temurin:21

## Impact Analysis

### Dependency Changes

| File    | Dependency              | Current | Action  | Target | Reason                                          |
|---------|-------------------------|---------|---------|--------|-------------------------------------------------|
| pom.xml | java.version            | 1.8     | upgrade | 21     | User requested                                  |
| pom.xml | maven.compiler.source   | 8       | upgrade | 21     | Must match java.version                         |
| pom.xml | maven.compiler.target   | 8       | upgrade | 21     | Must match java.version                         |
| pom.xml | maven-compiler-plugin   | (managed 3.10.1) | add override | 3.13.0 | 3.10.x has limited Java 21 support |

### CI/CD Changes

| File        | Location              | Current                              | Required Change                        |
|-------------|-----------------------|--------------------------------------|----------------------------------------|
| Dockerfile  | FROM build stage      | maven:3.9.6-eclipse-temurin-8        | maven:3.9.6-eclipse-temurin-21         |
| Dockerfile  | FROM runtime stage    | eclipse-temurin:8-jre                | eclipse-temurin:21-jre                 |

## Upgrade Steps

- **Step 1**: Setup Environment — JDK 21 already available
- **Step 2**: Setup Baseline — Run tests with Java 8
- **Step 3**: Upgrade Java Version to 21 — Update pom.xml + Dockerfile
- **Step 4**: Final Validation — Full build + tests under Java 21
