# Normative units — 括弧開始のみの断片（100 units, PROVED_SCOPE）

Dependency-ready fragments recorded UNRESOLVED because the 原文 is a truncated
parenthesized fragment (starts with （ but has no matching closing ）). Only the
structural claim is kernel-proven: the fragment starts with a full-width opening
parenthesis (20 unique variants). The substantive norm is NOT MODELLED;
`unhandled_conditions` retains the fragment, so status derives `PROVED_SCOPE`,
never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | A truncated-parenthesis fragment begins with the full-width opening parenthesis （; no substantive norm is asserted. |
| T | `lake build JapanTaxLaw.TruncatedParenFragmentsTests` (20 `native_decide` kernel checks + generic spec agreement); `python scripts/ci/source_audit_trunc.py` |
| D | Generic spec agreement plus per-variant opening-parenthesis checks (20); all 100 originals verbatim; all units retain `unhandled_conditions`. |
| C | Competing readings rejected: treating a truncated parenthesis as a complete heading, and treating a non-parenthesized label as truncated. |
| U | Substantive content NOT MODELLED and retained as unhandled conditions. Human legal review pending (separate axis). |
