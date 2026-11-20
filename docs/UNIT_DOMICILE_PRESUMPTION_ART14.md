# Normative unit — 340CO0000000096 art.14（国内住所の推定）

Unit: `NORM|1d310b3fc3fbdb5179921191135141b643f44a1685bff314ace7ed21aee111ba`

原文（pinned, 56文字）:
「国内に居住することとなつた個人が次の各号のいずれかに該当する場合には、その者は、国内に住所を有する者と推定する。」

| id | content |
|---|---|
| H | 国内への居住開始と各号該当の二条件を満たす個人は、国内に住所を有する者と推定される。 |
| T | `lake build JapanTaxLaw.DomicilePresumptionArt14Tests`; `python scripts/ci/source_audit_domicile_art14.py` |
| D | 実装と独立仕様がカーネル同値。両条件 true のみ推定成立、片方でも false なら不成立。原文3検査 true。 |
| C | 対立解釈: 各号のいずれかに該当すれば居住開始がなくても推定されると読む → 原文「居住することとなつた個人が…場合には」に反し却下。各号の具体的内容は当該単位外。 |
| U | 各号の具体的要件・反証の手続・推定の期間は NOT MODELLED。人間法的レビュー未実施。 |

推定の成立条件のみをモデル化し、条全体の完成を主張しない。
