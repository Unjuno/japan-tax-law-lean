# Normative units — 委任・参照・免除・両罰の残り（1573 units）

Five repeated §3 families, all dependency-ready:

| family | units | structure |
|---|---|---|
| delegation | 897 | …適用に関し必要な事項／経過措置は政令で定める |
| ref_fragment | 537 | （同法, （以下この条, 納税の猶予に係る期限, 財務省令で定める要件, に準ずるもの, 政令で定める場所, 該当することとなつた日 |
| enforcement | 73 | 公布の日から施行し…以後適用 / 次条は公布の日から施行 / 郵政民営化法の施行日 |
| dual | 50 | 行為者を罰するほか法人又は人に刑を科する |
| waiver | 16 | やむを得ない事情を認める場合には書類添付を要しない |

| id | content |
|---|---|
| H | Delegated content and reference targets are supplied externally; enforcement provisos apply from a trigger date; dual sanctions are an independent conjunction; a document requirement is waived only when a recognized reason exists. |
| T | `lake build JapanTaxLaw.DelegationRefsAndWaiversTests`; `python scripts/ci/source_audit_deleg2.py` |
| D | Kernel proofs of delegation/reference identity, reference-kind distinctness, from-date boundary (at/after/before), dual conjunction projection/construction/independence and waiver exclusivity; spec agreement; all 1,573 originals verbatim (4/4 checks). |
| C | Competing readings rejected: delegated content as if stated in the statute, applying an enforcement proviso before its trigger date, a single sanction for both roles, and waiving a document without a recognized reason. |
| U | Concrete content, targets, dates, sanctions and reasons NOT MODELLED. Human legal review pending. |
