# Adversarial review — batch 43

### ReadingSubstitutionMunicipal.lean — 公共サービス実施民間事業者省令 第三条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="3"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/418M60000008099_20240401_505M60000008106.law.json`（law 418M60000008099, revision 418M60000008099_20240401_505M60000008106, 公共サービス実施民間事業者省令）。
- SHA-256 再計算: `c4b5784d5131dac1c93167ffb523688ad889586483a148504af730ede9af2e10`（生バイト 10382 バイト）→ CONFIRMED。
- Article 定位: `Num="3"` を構造走査で 1 件検出、needle はその Article ノード内に verbatim 1 回（原文全体でも 1 回）→ CONFIRMED。
- 逐語照合: needle「この場合において、前項中「市又は区若しくは総合区」とあるのは、「区又は総合区」と読み替えるものとする。」は原文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 読替え写像再計算: 「市又は区若しくは総合区」→「区又は総合区」（前項の市を含む選択肢を除去）。原文で前者は 2 回（第1項の本体 1 回 + needle 内の引用 1 回）、後者は 1 回（置換後のみ）。数詞・閾値は存在せず STRUCTURAL → BY-DESIGN。
- 検出器: `independent_spec_ok` True（spec は独自型 SpecPhrase と独自写像 specSubstitute のみで impl 識別子なし。橋渡しは普遍定理 agreeSubstitute = `cases p <;> rfl` の純粋書き換えで axiom-free、by_cases/omega/Classical.choice 不使用）、`spec_literals` = ∅（数値リテラルなし。原文対応は pinned needle のみ）→ CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な読替え「市又は区若しくは総合区」→「区又は総合区」のみをモデル化。発動条件「この場合において」、第1項・第2項の実体的送付規則、他の条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第三条第2項の「前項中「市又は区若しくは総合区」とあるのは、「区又は総合区」と読み替えるものとする」という明示的な読替えのみ。
- T（逐語性）: 自前再抽出の needle が原文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 市的選択肢を除くテキスト書き換えとして Phrase → Phrase、SpecPhrase → SpecPhrase を定義。橋渡しは toSpec を経由する普遍定理かつ `cases ... <;> rfl` のみで追加公理を導入しない。
- C（整合）: 三構成要素それぞれの書換え・二回適用の冪等性・impl↔spec 一致を全て `rfl` で確認、矛盾 0。
- U（範囲外）: 発動条件、送付手続・委託地方公共団体、他の条項、数値閾値（本 unit は STRUCTURAL）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
