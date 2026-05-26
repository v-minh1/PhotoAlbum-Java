# Upgrade Plan

## Overview

Upgrade the Java project to **Java 21 LTS**.

Java 21 is a Long-Term Support (LTS) release that brings significant improvements including virtual threads (Project Loom), pattern matching enhancements, records, sealed classes, and better performance and security.

## Tasks

See `.metadata/tasks.json` for the detailed task breakdown.

| # | Task | Type | Status |
|---|------|------|--------|
| 001 | Upgrade to Java 21 | upgrade | pending |

## Open Questions

- **Java 25 available**: The latest stable Java LTS version is Java 25. You requested Java 21 — this plan targets Java 21 as specified. If you'd like to upgrade to Java 25 instead, please update the plan accordingly.
- **Framework compatibility**: If your project uses Spring Boot 4.x (which requires Java 25), upgrading only to Java 21 may cause incompatibilities. Please confirm whether you also need to upgrade or downgrade Spring Boot to a Java 21-compatible version (Spring Boot 3.x supports Java 17–21).
