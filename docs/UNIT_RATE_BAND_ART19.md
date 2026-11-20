# Normative unit — 347CO0000000151 art.19 別表金額帯

Unit: `NORM|19ad3c0f39ad4ec9480de4e7e90ab21b00a4f7dcf2ff45b75927e9e3c81f691e`

原文（pinned 別表セル, 15文字）:「千万円以上千五百万円未満の金額」

| id | content |
|---|---|
| H | 当該別表セルの条件は、金額（円）が一千万円以上かつ千五百万円未満であることである。 |
| T | `lake build JapanTaxLaw.RateBandArt19Tests`; `python scripts/ci/source_audit_rate_band_art19.py` |
| D | 実装と独立仕様がカーネル同値; 境界 9,999,999 不該当 / 10,000,000 該当 / 14,999,999 該当 / 15,000,000 不該当（「未満」を排他と確認）。原文3検査 true。 |
| C | 対立解釈: 「千五百万円未満」を「以下」と読む → 原文「未満」に反し却下。金額を実数と読む → 原文の金額は円単位の整数として caller-established とし、Nat でモデル化（小数の取扱いは当該単位外）。 |
| U | 当該セルの税率・他の金額帯・算定手続は NOT MODELLED。境界値の実際の適用判断は caller-established。人間法的レビュー未実施。 |

上限の排他性（「未満」）を境界例で明示する。条文全体や税率表全体の完成を主張しない。
