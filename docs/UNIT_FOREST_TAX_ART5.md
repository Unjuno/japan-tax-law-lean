# Normative unit — 431AC0000000003 art.5（森林環境税の税率）

Unit: `NORM|15dbfd55148fe076292eefe260fcfbef38379592bdf6b51fa59a0a7f7bc8b6f6`

原文（pinned, 13文字）:「森林環境税の税率は、千円とする。」

| id | content |
|---|---|
| H | 森林環境税の税率は年額 1,000 円（円、Nat）である。 |
| T | `lake build JapanTaxLaw.ForestEnvironmentTaxRateTests`; `python scripts/ci/source_audit_forest_tax_art5.py` |
| D | 実装と独立仕様がカーネル同値; 1000 のみ真、0/999/1001 は偽。原文3検査 true。 |
| C | 対立解釈: 「千円」を月額と読む → 原文に期間の定めがなく、年額として扱う（期間は caller-established として明示）。「千円以上」と読む → 原文「とする」に反し却下。 |
| U | 課税主体・課税標準・徴収手続・附則は NOT MODELLED。人間の法的レビュー未実施。 |

税率の定数のみをモデル化し、条全体の完成を主張しない。
