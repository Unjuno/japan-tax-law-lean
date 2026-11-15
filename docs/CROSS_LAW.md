# Phase E — 法令横断検証（着手・シード）

2026-11-15 時点の記録。**PHASE E は完成ではありません。** 本書は横断検証の最初の着手点（ピン留め整合チェッカー）と、その成果物の限界を明示します。

## スコープ（実施済み）

`scripts/law_audit/phase_e/cross_law.py` — L1（法令台帳）と L3（Lean モジュール）の横断チェッカー。

検査内容（すべて機械的・決定論的・失敗時は非ゼロ終了）:

| # | 検査 | 失敗時 |
|---|---|---|
| 1 | `Law id:` が `data/INVENTORY.json` に存在するか | 失敗 |
| 2 | 台帳の `current_revision_status` が `CurrentEnforced` か | 失敗 |
| 3 | 台帳の `audit_ready` が true か | 失敗 |
| 4 | `Revision:` が `current_revision.law_revision_id` と一致するか | 失敗 |
| 5 | `Raw snapshot sha256:` が `raw_snapshot.source_sha256` と一致するか | 失敗 |
| 6 | Spec モジュールの `Revision:` のみのピン留めも現行改正版と照合 | 失敗 |
| 7 | 完全未施行の 2 法令（防衛特別所得税関連 508CO0000000106 / 508M60000040027、`data/INVENTORY.json` の `summary.unresolved` 由来）がどの Lean モジュールからもピン留めできないこと | 失敗 |
| 8 | ピン留めのないモジュールは `unpinned` として列挙（検証済みにカウントしない） | 報告のみ |

バイトレベルの原文 SHA-256 照合（`data/raw/*.law.json` の再ハッシュ）は `scripts/law_audit/inventory/validate_inventory.py` の責務です。本チェッカーは台帳↔Lean のピン留め整合のみを扱います。

実行結果（2026-11-15）:

```
python scripts/law_audit/phase_e/cross_law.py
# → scanned 100 Lean files; 74 pinned modules consistent, 0 failed;
#   26 unpinned (not counted as verified);
#   unresolved unenforced laws: 508CO0000000106, 508M60000040027
```

詳細は `build/cross_law.json`（`build/` はコミット対象外）に出力されます。

テスト: `python -m unittest scripts.tests.test_cross_law -v` — 実リポジトリのピン留め整合（3 テスト）+ 合成ツリーによる全失敗経路（9 テスト）。CI（`.github/workflows/lean.yml`）の `python-audit` ジョブに組込み済み。

## スコープ（未実施）

- 法令**間**の意味的矛盾検査（定義競合・優先関係違反の横断検出）
- 消費税法 ↔ 通則法 ↔ 地方税法 間の参照解決・優先適用の体系的検査
- Phase B の参照候補 3,322 件（すべて**未確定**、独立の法的レビュー未実施）に対する横断意味検証
- 改正影響解析（PHASE F — 新旧条文差分の横断伝播）
- 関税法・租税特別措置法・印紙税法・登録免許税法等の未着手税目

## verified-anomaly の扱い

本チェッカーが `ok` を返しても、それが意味するのは「ピン留めが台帳と一致する」ことのみです。条文間の法的矛盾や欠陥の発見を意味しません。候補は独立レビュー前に欠陥と呼ばず、`verified-anomaly` は 0 件を維持します。

## 再現手順

```sh
python scripts/law_audit/inventory/validate_inventory.py   # 台帳のバイトレベル検証（前提）
python scripts/law_audit/phase_e/cross_law.py              # 本チェッカー（build/cross_law.json へ出力）
echo $?                                                    # 0 = 全ピン留め一致
```
