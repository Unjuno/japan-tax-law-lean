# Normative unit — 326AC1000000145 art.14（税理士法 過料）

Unit: `NORM|91349ec2d835e0fe4fdd63ea17f15c1ce9a98c22d91c36f03bea07410596f64e`

原文（pinned, 30文字, 独立抽出）:
「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

## H / T / D / C / U

| id | content |
|---|---|
| H | 当該一文の効果は、各号該当者（caller-established）に対する十万円以下の過料の上限である。 |
| T | `lake build JapanTaxLaw.TaxAccountantFineTests`; `python scripts/ci/source_audit_tax_accountant_art14.py` |
| D | 実装と独立仕様がカーネル同値; 境界 0/99999/100000 許可, 100001 不許可, 非該当者は本条不適用。原文3検査すべて true。 |
| C | 対立解釈: 上限を「十万円未満」と読む → 原文「以下」に反し却下。UI の文字化け表示から五百万円と読む → pinned 原文の独立抽出で十万円と確定し却下（誤読を実測で排除）。 |
| U | 各号の具体的区分（第三・四・七・十一・十二条）は当該単位外で NOT MODELLED / caller-established。過料の手続・軽減・併科は対象外。人間法的レビュー未実施。 |

上限十万円はモデル化するが、条文全体や過料制度全体の完成を主張しない。
