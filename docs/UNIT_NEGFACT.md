# Normative units — 否定事実条件（「…ないこと。」）（116 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…いこと。」(=
「…ないこと。」) assert a negative fact as a condition ("the fact that X is not
the case") gating a consequence.

| id | content |
|---|---|
| H | A negative assertion holds iff its proposition is false; double negation yields the positive assertion; a positive and negative assertion for the same proposition are mutually exclusive; multiple negative facts trigger on any (OR) or all (AND). |
| T | `lake build JapanTaxLaw.NegativeFactConditionsTests`; `python scripts/ci/source_audit_negfact.py` |
| D | Kernel proofs of negation, double negation, exclusivity, disjunction, conjunction and spec agreement; all 116 originals verbatim (3/3 checks). |
| C | Competing readings rejected: a negative assertion holding while its proposition is true; positive and negative assertions both holding; treating AND as OR. |
| U | Concrete facts and consequences NOT MODELLED; human legal review pending (separate axis) → PROVED_SCOPE. |
