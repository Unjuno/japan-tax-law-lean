# Normative unit — 325AC0000000226 art.181（鉱区税の賦課期日）

Unit: `NORM|1b0899b00c654642e9981f5b9ce1d9a8ce67dbde27f969956cbacee751aca29a`

原文（pinned, 18文字）:「鉱区税の賦課期日は、四月一日とする。」

| id | content |
|---|---|
| H | 鉱区税の賦課期日は4月1日である（時間的適用）。 |
| T | `lake build JapanTaxLaw.MiningTaxLevyDateTests`; `python scripts/ci/source_audit_levy_date_art181.py` |
| D | 実装と独立仕様がカーネル同値。4/1 のみ真、4/2・3/1・5/1 は偽。原文3検査 true。 |
| C | 対立解釈: 4月1日「以降」と読む → 原文「…とする」に反し却下。日付を文字列として扱う → 月・日を Nat として型付きで表現（暦の検証は当該単位外）。 |
| U | 閏年・暦法・納期限・賦課期日以外の手続は NOT MODELLED。人間法的レビュー未実施。 |

賦課期日の定義のみをモデル化し、条全体の完成を主張しない。
