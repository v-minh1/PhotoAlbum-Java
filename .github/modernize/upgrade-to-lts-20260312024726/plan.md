# Upgrade Plan

## Overview

Upgrade the Java project to the latest LTS versions: **Java 21** and **Spring Boot 3.4**.

## Tasks

See [tasks.json](./tasks.json) for detailed task breakdown.

### 001 — Upgrade Java & Spring Boot

- Upgrade JDK to **Java 21**
- Upgrade Spring Boot to **3.4**
- Upgrade Spring Framework to **6.x**
- Migrate `javax.*` to `jakarta.*` namespace where required
- Update all Spring ecosystem dependencies (Spring Security, Spring Data, etc.) to Spring Boot 3.4-compatible versions
- Ensure build tooling (Maven/Gradle) targets Java 21
