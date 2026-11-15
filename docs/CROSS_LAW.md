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
# → scanned 125 Lean files; 98 pinned modules consistent, 0 failed;
#   27 unpinned (not counted as verified);
#   unresolved unenforced laws: 508CO0000000106, 508M60000040027
```

詳細は `build/cross_law.json`（`build/` はコミット対象外）に出力されます。

テスト: `python -m unittest scripts.tests.test_cross_law -v` — 実リポジトリのピン留め整合（3 テスト）+ 合成ツリーによる全失敗経路（9 テスト）。CI（`.github/workflows/lean.yml`）の `python-audit` ジョブに組込み済み。

## スコープ（意味的クロスロー検査 — PhaseECorpRates, 初の試み）

2026-11-16 時点: **1 モジュールのみ**。`JapanTaxLaw/PhaseECorpRates.lean` —
法人税法 art. 66（法人税率）↔ 租税特別措置法 art. 67の2(1)（特定の医療法人の法人税率の特例: かかわらず百分の十九）と
art. 68(1)(2)（特定の協同組合等の法人税率の特例: 読替えにより、10億円までは百分の十九・超過分百分の二十二、
12ヶ月未満事業年度は月数按分）の**意味的整合性**を機械検査する。

核になっている主張（すべて **モデルに関する** 定理。法文の解釈の正しさは主張しない）:

| # | 主張 | 証明 |
|---|---|---|
| 1 | 特殊帯が二つの通常帯の間にある: 19% < 22% < 23.2% | `rate_band_order`（decide） |
| 2 | art. 67の2(1) の税率は art. 66(3) の百分の十九と**同一**（特例の実質は "かかわらず" 条項による art. 66(1)(2)(6) の排除であって、税率新設ではない） | `med_spec_eq_public_rate`（rfl） |
| 3 | 12ヶ月事業年度・所得 ≤ ¥10億では、art. 68 の税額 = art. 66(3) の税額（創設的な特例は超過分のみ） | `coop_eq_public_rate_below_cap` |
| 4 | cap 超過部分は 19%×cap + 22%×超過の分裂加法性 | `coop_excess_band_composition` |
| 5 | art. 68 cap は月数に単調（月数∈[1,12]） | `coopSpecialCap_mono` |
| 6 | 特殊税額は所得に単調非減少 | `coopSpecialTaxRaw_mono` |
| 7 | 非適格なら art. 66(3)（百分の十九）にフォールバック | モデル定義 `coopSpecialTax` |

- Pin は 2 法令とも共記・台帳照合（下記ブロック分割チェッカーを通る）。
- art. 67の2 の国税庁長官の承認・取消し手続（art. 67の2(2)–(5)）、art. 68 の三要件（物品供給収入比率・組合員数・店舗収入）は **externally established な呼出元入力**であり、本モデルは判断しない。
- art. 68 の月数按分除算（cap = 十億円×月数÷12）は切り捨て（modeling candidate、法文は端数処理を明示しない）。
- `cross_law.py` は複数法令のピンを持つモジュールをブロック単位で独立照合する（回帰テスト: `test_two_law_module_blocks_checked_independently` / `test_two_law_module_bad_second_block_fails`）。
- verified-anomaly = 0 を維持。候補 3,438 件（すべて**未確定**）に対する横断意味検証は**未実施**。

## スコープ（未実施）

- 法令**間**の意味的矛盾検査（定義競合・優先関係の横断検査 — 本書上記の1モジュール以外は未着手）
- 消費税法 ↔ 通則法 ↔ 地方税法 間の参照解決・優先適用の体系的検査
- Phase B の参照候補 3,438 件（すべて**未確定**、独立の法的レビュー未実施）に対する横断意味検証
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
