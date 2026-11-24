# In-scope acquisition / formalization backlog (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/source_backlog.py`.

All items remain IN SCOPE. UNSUPPORTED/NOT_IMPLEMENTED is the current implementation state; no item is a permanent exclusion and no item stops other formalization work.

| item | layer | declared count | acquisition | formalization |
|---|---|---:|---|---|
| L2-ORDINANCE-ACQUISITION | L2_ORDINANCE | 1788 | NOT_ACQUIRED | NOT_IMPLEMENTED |
| L3-TREATY-ACQUISITION | L3_TREATY | - | NOT_ACQUIRED | NOT_IMPLEMENTED |
| L4-CIRCULAR-STAGING | L4_CIRCULAR | - | NOT_ACQUIRED | NOT_IMPLEMENTED |
| L5-CASELAW-STAGING | L5_CASELAW | - | NOT_ACQUIRED | NOT_IMPLEMENTED |
| L6-HISTORICAL-PINNING | L6_HISTORICAL | 20 | NOT_PINNED | NOT_IMPLEMENTED |
| REF-EXTERNAL-BINDING | L0_STATUTE | 161664 | UNVERIFIED | NOT_IMPLEMENTED |
| REF-UNMATCHED-NAMES | L0_STATUTE | 7526 | UNMATCHED | NOT_IMPLEMENTED |
| TAX-NAME-CANDIDATES | L0_STATUTE | 2873 | CANDIDATE | NOT_IMPLEMENTED |

Every item carries the same verification obligations: acquire pinned bytes with SHA-256, record law/municipality id and enforced revision, identify article / paragraph / item / table cell, decompose normative content including exceptions and effects, independent spec + implementation bridged by a kernel proof, source correspondence audit scoped to that article/cell, independent adversarial review (never a human legal approval).

Human legal review stays LEGAL_REVIEW_PENDING and is never satisfied by
acquisition, Lean proof or mechanical review. No item blocks another unit.
