# Normative unit — 325AC0000000073 art.23（残存期間の帯）

Unit: `NORM|debfc248b22ee3e700e03035ae835d23c48ca62532be58e7d0ea1a7cec8ebe88`

原文（pinned, 16文字）:「残存期間が十年を超え十五年以下のもの」

| id | content |
|---|---|
| H | 残存期間（年）が10年超15年以下であること。下限は排他、上限は包含。 |
| T | `lake build JapanTaxLaw.RemainingPeriodBandTests`; `python scripts/ci/source_audit_period_art23.py` |
| D | 実装と独立仕様がカーネル同値。10/16 は不該当、11/14/15 は該当。原文3検査 true。 |
| C | 対立解釈: 「十年を超え」を「十年以上」と読む → 原文「超え」に反し却下。「十五年以下」を「未満」と読む → 原文「以下」に反し却下。 |
| U | 残存期間の算定方法・端数処理・他帯・税率は NOT MODELLED。人間法的レビュー未実施。 |

帯条件のみをモデル化し、条全体の完成を主張しない。
