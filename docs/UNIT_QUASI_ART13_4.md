# Normative unit — 329M50000002023 art.13_4（個人の市町村民税への準用）

Unit: `NORM|64b83716c4c799383c697121bca0ad46831d0951b2f1f9d8622f56cbdfe3a10c`

原文（pinned, 23文字）:「第一項の規定は、個人の市町村民税について準用する。」

| id | content |
|---|---|
| H | 第一項の規定は、対象が個人の市町村民税である場合に準用される。 |
| T | `lake build JapanTaxLaw.MunicipalTaxQuasiApplyTests`; `python scripts/ci/source_audit_quasi_art13_4.py` |
| D | 実装と独立仕様がカーネル同値。対象区分 1（個人の市町村民税）のみ準用、0/2 は非該当。原文3検査 true。 |
| C | 対立解釈: 他の市町村民税（法人等）にも準用すると読む → 原文が「個人の」と限定しているため却下。税目コードは caller-established な符号化であり原文の文言ではない。 |
| U | 第一項の具体的規定内容・読み替え字句・他税目への準用は NOT MODELLED。人間法的レビュー未実施。 |

準用の対象判定のみをモデル化し、条全体の完成を主張しない。
