# Normative units — 事実提示条件（「…ること。」）（1014 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…ること。」assert
a proposition as a condition ("the fact that X holds") gating a consequence.

| id | content |
|---|---|
| H | An assertion-condition holds iff its underlying proposition holds; denial is negation; assertion and denial are exclusive; multiple assertions trigger on any (OR) or all (AND); an implication with a true assertion yields a true consequent. |
| T | `lake build JapanTaxLaw.FactAssertionConditionsTests`; `python scripts/ci/source_audit_factassert.py` |
| D | Kernel proofs of assertion, denial, exclusivity, disjunction, conjunction, implication and spec agreement; all 1014 originals verbatim (3/3 checks). |
| C | Competing readings rejected: an assertion holding without its proposition; assertion and denial both holding; treating AND as OR; implication firing with a false antecedent. |
| U | Concrete facts, parties and consequences NOT MODELLED; human legal review pending (separate axis) → PROVED_SCOPE. |
