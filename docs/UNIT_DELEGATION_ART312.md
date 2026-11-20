# Normative unit — 325AC0000000226 art.312（収益事業の範囲の委任）

Unit: `NORM|29d04706ea24185c86b2152ccc2a22513fd3733bb63bfaecfc4e260e1283c879`

原文（pinned, 20文字）:「第一項の収益事業の範囲は、政令で定める。」

| id | content |
|---|---|
| H | 収益事業の範囲は本条では確定されず、政令に委任される（自执行的でない）。 |
| T | `lake build JapanTaxLaw.ProfitBusinessDelegationTests`; `python scripts/ci/source_audit_delegation_art312.py` |
| D | 委任先が政令（コード1）であること、省令でないこと、範囲が本条で確定されないことをカーネルで確認。原文3検査 true。 |
| C | 対立解釈: 委任先を財務省令と読む → 原文「政令」に反し却下。委任を自执行的（本条で範囲が確定）と読む → 「政令で定める」に反し却下。 |
| U | 政令の具体的な範囲・改正手続・委任の限界は NOT MODELLED。人間法的レビュー未実施。 |

委任関係のみをモデル化し、政令の内容や条全体の完成を主張しない。
