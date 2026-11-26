### SubstituteMemberResidualTerm.lean — 国税審議会令 第四条第一項ただし書（補欠委員の残任期間）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit20.py` → `raw bytes: 28843` / `sha: 165d5edc3356cf47fead9f75eac0d3cd410266ef01827d8880614af90d8c0186` / `inv sha: 165D5EDC…0186`（大小文字違いのみ）/ `rev: 412CO0000000278_20260401_507CO0000000412` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。確度: 高。
- **C（** 一次資料 `data/raw/412CO0000000278_20260401_507CO0000000412.law.json`。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 196` / `in scoped: True` / srcpath `Article:4/Paragraph#1/ParagraphSentence/Sentence#2`（MAIN provision, proviso）。
- **D（** **PASS**。全局 1、第四条 scoped 内に存在。附則ではない。確度: 高。
- **C（** 同文は他条・附則に重複しない。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0。impl は残任期間をそのまま返す射影、独立 spec は Nat 構造再帰（`0 => 0 | succ n => succ n`）で異なる定式化、impl 名非参照。原文に金額 literal が無いため needle を anchor。境界 3 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_substitute_term` は `cases c <;> rfl` のみで公理を導入しない。
- **C（** 過去の `Classical.choice` 失敗を踏まえ構造的証明を選択。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 残任期間を誤って丸め／加算していないか、通常任期（二年）を誤包含していないか。
- **T（** `substituteTerm 0 = 0` / `substituteTerm 2 = 2`（Tests）、`term_equals_residual` は全 Nat 普遍。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。残任期間はそのまま補欠任期となる（恒等）。0 年・2 年ともに正しく、off-by-one なし。通常任期は Scope で明示的に除外。
- **C（** 単位は年、定義域は Nat（全整数年の残任期間）。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 本則の二年任期・任命更新規定は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
