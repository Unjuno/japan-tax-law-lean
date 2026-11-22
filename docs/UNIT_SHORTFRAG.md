# Normative units — 短いラベル片（8359 units, PROVED_SCOPE）

Dependency-ready fragments recorded UNRESOLVED because the 原文 is a short label
token（経費の種類, 表示単位, 第一項第二号, …）rather than a self-contained norm. Only
the structural claim is kernel-proven: the fragment is a non-empty string of
length at most 6 (3,166 unique variants). The substantive norm of the provision
is NOT MODELLED; `unhandled_conditions` retains the original fragment, so status
derives `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | A short label fragment is a non-empty string of length ≤ 6; no substantive norm is asserted. |
| T | `lake build JapanTaxLaw.ShortLabelFragmentsTests` (6,332 `native_decide` kernel checks); `python scripts/ci/source_audit_shortfrag.py` |
| D | Per-variant kernel checks of the structural predicate and independent spec agreement (6,332 checks); all 8,359 originals verbatim; all units retain `unhandled_conditions`. |
| C | Competing readings rejected: treating a bare short label as a substantive norm, and treating an empty or over-long string as a short label. |
| U | Substantive content of the provisions using these labels NOT MODELLED and retained as unhandled conditions. Human legal review pending (separate axis). |
