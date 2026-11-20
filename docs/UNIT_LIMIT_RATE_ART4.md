# Normative unit — 362CO0000000335 art.4（限度税率が百分の十二である場合）

Unit: `NORM|1719cd386262871d3745390bf5918fbab585aaec2c207e8055753cb669bf0cd9`

原文（pinned, 14文字, 別表欄）:「限度税率が百分の十二である場合」

| id | content |
|---|---|
| H | 当該条件は、限度税率（%）が十二に等しいことである。 |
| T | `lake build JapanTaxLaw.LimitRate12ConditionTests`; `python scripts/ci/source_audit_limit_rate_art4.py` |
| D | 実装と独立仕様がカーネル同値; 12 のみ真、0/11/13 は偽。原文3検査 true。 |
| C | 対立解釈: 「百分の十二」を 0.12 と読む → 単位を % の整数 12 としてモデル化（分数表現は原文どおり百分率）。「十二以上」と読む → 原文「である」に反し却下。 |
| U | 税率の算定主体・他の税率帯・適用手続は NOT MODELLED / caller-established。人間法的レビュー未実施。 |

当該条件のみをモデル化し、条全体の完成を主張しない。
