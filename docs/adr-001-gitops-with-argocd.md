# ADR-001: Use Argo CD for Kubernetes GitOps

## Status

Accepted

## Context

The platform needs a declarative delivery model where Kubernetes desired state is versioned, reviewed, and automatically reconciled.

## Decision

Use Argo CD with an app-of-apps bootstrap and ApplicationSets for environment fan-out.

## Consequences

- Operators can audit every change through Git history.
- Rollback becomes a Git revert or Argo CD sync to a previous revision.
- Teams must avoid manual cluster mutations except emergency operations.
