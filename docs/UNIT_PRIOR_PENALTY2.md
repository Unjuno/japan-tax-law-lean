# Normative units — 従前例罰則・附則委任・枝番号（1,083 units）

| family | units | structure |
|---|---|---|
| prior_penalty | 582 | 施行前の行為・附則で従前/効力有とされる施行後行為の罰則は従前の例 |
| misc_term | 289 | 地方団体の種類, 金額, 同年四月及び五月, 免除/追徴の規定 etc. |
| suppl_deleg | 200 | 附則第二条から前条まで…必要な経過措置は政令で定める |
| subitem_label | 12 | 二十一の二 etc. — (ordinal, sub) pair |

| id | content |
|---|---|
| H | Pre-enforcement acts carry old-law penalties; terms and delegated content are externally supplied; sub-item labels are ordinal pairs. |
| T | `lake build JapanTaxLaw.PriorPenaltyAndDelegation2Tests`; `python scripts/ci/source_audit_ppd2.py` |
| D | Kernel proofs of the enforcement boundary for penalties, term/delegation identities and sub-item parsing; spec agreement; all 1,083 originals verbatim (4/4 checks). |
| C | Competing readings rejected: old penalty for post-enforcement acts, delegated content as if in the statute, and a wrong sub-item ordinal. |
| U | Concrete provisions, targets and amounts NOT MODELLED. Human legal review pending. |
