### ParagraphSixSevenReading.lean — たばこ税法改正政令整備政令 第三条（第六項・第七項の準用）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit22.py` → `raw bytes: 16082` / `sha: b6ae25c119ea3741f5567f8fb9bdbddc21b8bc992f00af56d7de585b848f51cd` / `inv sha: B6AE25C1…51CD`（大小文字違いのみ）/ `rev: 422CO0000000060_20101001_000000000000000` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。確度: 高。
- **C（** 一次資料 `data/raw/422CO0000000060_20101001_000000000000000.law.json`。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。初回ドラフトで needle に誤字（「前項の規定する場合」）があったが、実行前に原文と照合して訂正した。
- **T（** `needle whole law: 1` / `scoped chars: 2153` / `in scoped: True` / srcpath `Article:3/Paragraph#9/ParagraphSentence/Sentence#1`（MAIN provision）。
- **D（** **PASS**。全局 1、第三条 scoped 内に存在。附則ではない。確度: 高。
- **C（** 同文は他条・附則に重複しない。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0。独立 spec は命題的等号 OR（`if k = 0 || k = 1 then 1 else 0`）で impl の構造的パターンマッチと異なる演算子、impl 名非参照。条項番号は区分タグとして表現したため原文数値 literal は不要で、needle を anchor とする。境界 3 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_as_listed` は入れ子 `cases` + `decide`/`rfl` のみで公理を導入しない。
- **C（** 過去の `Classical.choice` 失敗を踏まえ構造的証明を選択。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 二条項の選択を誤っていないか、他条項を誤って含めていないか、前項の実質を誤包含していないか。
- **T（** `asListed 0 = 1` / `asListed 1 = 1` / `asListed 2 = 0`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。第六項・第七項に対応する 0/1 のみ listed、他は 0。off-by-one なし。前項の実質は Scope で明示的に除外。
- **C（** 数値は条項タグであり法令上の金額ではない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 第六項・第七項の実質内容と前項の触发条件は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
