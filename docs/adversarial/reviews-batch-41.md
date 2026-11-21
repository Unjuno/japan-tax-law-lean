# Adversarial review — batch 41

### NickelContentThreshold.lean — 溶融亜鉛めっき鋼帯等暫定不当廉売関税政令 第一条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="1"` を定位・正規化。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/508CO0000000254_20260808_000000000000000.law.json`（law 508CO0000000254, revision 508CO0000000254_20260808_000000000000000）。
- SHA-256 再計算: `aed868d547988eef85a4fe851b8e46bb92ea4b237502c20e76a702a1232e72b0`（生バイト 25013 バイト）→ CONFIRMED。
- Article 定位: `Num="1"` を構造走査で 1 件検出、needle はその Article ノード内に verbatim 1 回 → CONFIRMED。
- 逐語照合: needle「バイメタル（張合せ加工を行ったもので、ニッケルの含有量が全重量の十パーセントを超えるものに限る。）」は原文に verbatim 1 回存在（判定: FOUND）→ CONFIRMED。
- 数詞再計算: 十パーセント = 10% = 10/100。「超える」は STRICT >。nickel/total > 10/100 ⇔ 100*n > 10*t ⇔ 10*n > total（正の因子 10 で約分）。impl の係数 10 と spec の specPct=10 が一致 → CONFIRMED。
- 境界照合 (≥3): (0,0) → false（ゼロ除算ガード）; (11,100) → true（11%）; (10,100) → false（ちょうど 10% は超えない）; (9,100) → false; (1,10) → false（ちょうど 10%）; (2,10) → true（20%）; (1,9) → true。impl↔spec 一致も全点で確認。矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（独立定数 specPct=10、impl 識別子なし。普遍定理 agreeExceeds は unfold + rfl の純粋書き換えで axiom-free、by_cases/omega/Classical.choice 不使用）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {10}、`source_literals_verified(spec_literals, scoped)` True（十 = 10 を原文「十パーセント」として verbatim 認識。分母 100 は spec リテラルに置かず導出として文書化）→ CONFIRMED。

判定: BY-DESIGN / CONFIRMED（原文の明示的な数値組成閾値「十パーセントを超える」= 全重量の 10% を厳密に超過、のみをモデル化。張合せ加工・バイメタル定義の他条件・暫定不当廉売関税率・対象貨物・他の条項は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第一条の「ニッケルの含有量が全重量の十パーセントを超える」という明示的な数値閾値のみ。
- T（逐語性）: 自前再抽出の needle が原文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 十パーセント → 10/100 → 10*n > t。impl は decide 係数 10、spec は独立定数 specPct=10。橋渡しは普遍定理かつ unfold + rfl のみで追加公理を導入しない。
- C（整合）: zero / 11%,10%,9% / 1/10,2/10 / 交叉乗法恒等式 / impl↔spec 一致を全て `by decide` または普遍定理で確認。
- U（範囲外）: 張合せ加工の定義、バイメタル該当性の他の要件、関税率・対象貨物、他の条文、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
