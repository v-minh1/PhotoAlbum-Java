# Upgrade Plan

## Overview

Upgrade the Java application to the latest LTS versions: Java 25, Spring Boot 4.x, and Spring Framework 7.x, including Jakarta EE migration (javax.* → jakarta.*).

## Tasks

See `.metadata/tasks.json` for the detailed task breakdown.

| # | Task | Description |
|---|------|-------------|
| 1 | `001-upgrade-java-spring-boot` | Upgrade to Java 25, Spring Boot 4.x, Spring Framework 7.x, and migrate javax.* to jakarta.* |

## Notes

- Spring Boot 4.x includes Spring Framework 7.x and requires Java 25.
- Jakarta EE migration (javax.* → jakarta.*) is included as part of the Spring Boot 4.x upgrade.
- No separate JDK or Spring Framework tasks are needed — they are covered by the Spring Boot 4.x upgrade task.
