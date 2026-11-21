# Normative units — 手続的義務規範（2,081 units, FULLY_VERIFIED）

Whole norm = deontic/procedural structure → `FULLY_VERIFIED`. Concrete actors
and amounts are caller-supplied and NOT MODELLED.

| family | structure |
|---|---|
| approval | 「…の承認を受けて…」 — action gated on approval |
| notification | 「…通知しなければならない」 — mandatory notification |
| payment | 「…納付しなければならない」 — mandatory payment |
| security | 「担保の提供を命ずる」 — ordered security provision |

| id | content |
|---|---|
| H | An approval-gated act is possible only when approval is held; mandatory acts are obligations; a security order is an issued command; mandatory and permissive modalities differ. |
| T | `lake build JapanTaxLaw.ProceduralDeonticNormsTests`; `python scripts/ci/source_audit_deontic.py` |
| D | Kernel proofs of approval gating, obligation fulfillment truth-table, order issuance and modality distinction; spec agreement; all 2,081 originals verbatim (4/4 checks). |
| C | Competing readings rejected: acting without approval, conflating mandatory with permissive, and treating an unissued order as issued. |
| U | Concrete actors/amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
