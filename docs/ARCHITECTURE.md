# アーキテクチャ — 7層とリポジトリの対応（2026-11-15 時点）

各層は独立してテスト可能である。層間の依存は上から下に局所化し、上位層の変更が下位層の正当性を侵食しないようにする。

| 層 | 役割 | 実装物（パス） | 検証アーティファクト |
|---|---|---|---|
| L1 Legal Sources | 公式法令の取得、版管理、施行日、改正履歴、原文ハッシュ | `scripts/law_audit/inventory/` (`build_inventory.py`, `pin_revisions.py`, `validate_inventory.py`)、`data/INVENTORY.json`、`data/raw/*.law.json`（2026-11-15 適用版、SHA-256）、`data/raw/*.revisions.json` | `validate_inventory.py` がオフラインでハッシュ整合を照合。`data/INVENTORY.json` に版・施行日・取得状況を記録 |
| L2 Legal Structure | 条・項・号・附則・参照の解析と法令依存グラフ | `scripts/law_audit/` (`model.py`, `rules.py`, `audit.py`, `report.py`, `inventory/sweep.py`)、`scripts/tests/` | テスト 35 件 + 誤変更注入 12 件、`audit.py` が R1 法令を監査、`inventory/sweep.py` が全対象法令を走査 |
| L3 Legal Semantics | 適用対象、定義、課税要件、例外、推定、擬制、免除、経過措置の型付き形式化 | `JapanTaxLaw/Residency.lean`, `Verdict.lean`, `VerdictLemmas.lean`, `StatutoryModel.lean`, `Excluded.lean`, `ResidencySpec.lean`, `Tests.lean` | `lake build`、公理依存検査（`propext` のみ）、各テスト Lean 実行 |
| L4 Tax Computation | 課税標準・税率・控除・税額・端数処理の形式モデル | 部分的（art. 89 税率表のみ） | 単位・期間・丸め・適用日を明示するテストが必要 |
| L5 Formal Verification | Lean 4 による健全性・決定性・規則間整合性・適用範囲の検証 | `JapanTaxLaw/ResidencySpec.lean`（独立形式仕様）、`Tests.lean` | `residency_spec_sound` / `residency_spec_complete` |
| L6 Counterexample Discovery | 矛盾、未定義、重複適用、参照不整合、境界値、改正前後差分の探索 | `scripts/tests/test_mutation_injection.py`（誤変更の検出機構）、候補のみを `AUDIT_REPORT.md` に記録 | 誤変更注入 12 クラス検出 |
| L7 Evidence and Reporting | 検出候補と原文・証明・反例・レビュー状況を紐づけた監査報告 | `docs/AUDIT_REPORT.md`（生成物）、`docs/INVENTORY.md`（Phase A 報告）、`docs/METHODOLOGY.md`、`docs/ARCHITECTURE.md`（本書）、`docs/CROSS_LAW.md`（Phase E シード） | 再現手順を各文書に記載 |

## 原則

- **検出候補は未確定**: 候補は独立の法的レビューを通過するまで欠陥と呼ばない。
- **不明 ≠ false**: 不明な前提は法に従い「不明」として扱う。推定・擬制・法的事実・例外を混同しない。
- **台帳外は未検証**: `data/INVENTORY.json` に含まれない法令は、いかなる形でも「検証済み」と表示しない。
- **証明成功 ≠ 法令解釈の正確性**: Lean が証明するのは形式モデルの内部命題のみ。
- **再現可能性**: 同じ入力から同じ検証結果を得られるよう、版・ハッシュ・施行日・実行手順を `docs/` と `data/` に固定する。

## 依存関係

```
L1 (法令ピン留め)
  → L2 (構造監査)      → L4 (計算仕様)
  → L3 (形式意味論)     → L5 (Lean 検証)
                      → L6 (反例探索)
  → L7 (報告)          ← 全層の成果物
```

横断検査（PHASE E）は L2 の参照解決に `data/INVENTORY.json` の母集団を必要とする。改正影響検証（PHASE F）は L1 の改正履歴ピン留めに依存する。
