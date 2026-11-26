### PrivateContractPublicAuctionReading.lean — 国税徴収法施行規則 第一条の六（随意契約時の公売規定準用）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** impl ヘッダの sha は二次情報。raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit9.py` → `raw bytes: 49890` / `sha: 7cdedf968d8411bfc591f5fba6f89d4885939f595772f6dfde9a302b63c847af` / `inv sha: 7CDEDF96…47AF`（大小文字違いのみ）/ `rev: 337M50000040031_20260521_506M60000040023` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。
- **C（** 一次資料 `data/raw/337M50000040031_20260521_506M60000040023.law.json`。確度: 高。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 775` / `in scoped: True` / srcpath `Article:1_6/Article#1_6/ArticleCaption`（MAIN provision）。
- **D（** **PASS**。全局 1、第一条の六 scoped 内に存在。附則ではない。
- **C（** 同文は他条・附則に重複しない。確度: 高。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0。独立 spec は命題的等号判定（`if c = 0 then 1 else c`）で impl の構造的パターンマッチと異なる演算子、impl 名非参照。原文に数値が無いため needle を anchor とする（構造スペックの既承認パターン）。境界 3 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_as_public_auction (c : Nat)` は `cases c <;> rfl` のみで公理を導入しない。
- **C（** 前回の READING ユニットで `omega`/`simp` が `Classical.choice` を導入した失敗を踏まえ、意図的に完全構造的証明を選択した。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 随意契約と公売を逆に符号化していないか、他モードを上書きしていないか、公売手続本体を誤包含していないか。
- **T（** `asPublicAuction 0 = 1` / `asPublicAuction 1 = 1` / `asPublicAuction 2 = 2`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。0（随意契約）→1（公売）、1 と 2 は不変。off-by-one なし。公売手続は Scope で明示的に除外。
- **C（** 数値は区分コードであり法令上の金額ではない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 随意契約の成立要件と公売規定の実質内容は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
