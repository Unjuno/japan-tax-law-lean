### MinisterialNecessityException.lean — 関税割当制度政令 第二条第四項ただし書（特に必要な場合の例外）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit15.py` → `raw bytes: 121798` / `sha: 81bef06a836f14b4e6f076be5de85026b4131c88fd2277eea91e310676edf27e` / `inv sha: 81BEF06A…DF27E`（大小文字違いのみ）/ `rev: 336CO0000000153_20260401_508CO0000000085` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。確度: 高。
- **C（** 一次資料 `data/raw/336CO0000000153_20260401_508CO0000000085.law.json`。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 979` / `in scoped: True` / srcpath `Article:2/Paragraph#4/ParagraphSentence/Sentence#2`（MAIN provision, proviso）。
- **D（** **PASS**。全局 1、第二条 scoped 内に存在。附則ではない。確度: 高。
- **C（** 同文は他条・附則に重複しない。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0。独立 spec は命題的等号判定（`if c = 0 then 1 else c`）で impl の構造的パターンマッチと異なる演算子、impl 名非参照。原文に金額 literal が無いため needle を anchor。境界 3 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_as_exception` は `cases c <;> rfl` のみで公理を導入しない。
- **C（** 過去の `Classical.choice` 失敗を踏まえ構造的証明を選択。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 例外の向きを誤っていないか（通常→例外ではなく例外→通常）、他区分を上書きしていないか、主規定を誤包含していないか。
- **T（** `asException 0 = 1` / `asException 1 = 1` / `asException 2 = 2`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。0（特に必要と認める場合）→1（この限りでない）、1 と 2 は不変。off-by-one なし。主規定は Scope で明示的に除外。
- **C（** 数値は区分タグであり法令上の金額ではない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: ただし書が修飾する主規定の実質は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
