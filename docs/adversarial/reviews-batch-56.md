# Adversarial review — batch 56

### RefundFineRange1M.lean — 還付金等罰則 第二十三条

- 独立再抽出: doc-comment / impl・spec・tests を一切信用せず、一時 Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="23"` を定位（MainProvision 直下の Article 一覧で 23 は一意、構造ヒット 1 件）、葉を逐語照合。一時スクリプトは worktree 外（`D:\CodexData\Temp\opencode`）に置き、repo は変更していない。
- 一次資料（正式名称の補正 = BY-DESIGN / CONFIRMED）: `data/raw/330AC0000000037_20260401_508AC0000000012.law.json`。見出しの「還付金等罰則」/ 指示文の「租税特別措置法に関する法律」は正式名称ではなく、source の `revision_info.law_title` と `INVENTORY.json` の `current_revision.law_title` は **輸入品に対する内国消費税の徴収等に関する法律**（略称 輸徴法, law_num 昭和三十年法律第三十七号, law_type Act, 条見出し （罰則））。見出し文字列は指示どおり維持し、正式名称は本文で補正記録する。
- Revision の確定（BY-DESIGN / CONFIRMED）: `INVENTORY.json` の `current_revision` / `raw_snapshot.source_file`、`revisions.json` の `current_revision_status=CurrentEnforced`、実ファイル名がいずれも `330AC0000000037_20260401_508AC0000000012`（施行 2026-04-01, 改正 令和八年法律第十二号, amendment_law_id 508AC0000000012）で一致。補正不要。
- SHA-256 再計算: 生バイト 305574 から `21c2b44d6e9a1d85d22b71b5c028b3e9276133d5e33a14d4e7c1a547e6068f94` を再計算（INVENTORY の大文字 pin `21C2B44D...6068F94` と同一）→ CONFIRMED。
- Article 定位: `Num="23"`（第二十三条, 見出し （罰則））, 2 段落目の文 → CONFIRMED。
- 逐語照合: needle「前項の犯罪に係る還付金相当額の三倍が百万円を超えるときは、情状により、同項の罰金は、百万円を超え当該相当額の三倍以下とすることができる。」は当該 Article 内に verbatim 1 回、全文でも 1 回（FOUND）→ CONFIRMED。
- 数詞再計算: 三倍 = 3, 百万円 = 1,000,000（two-anchor; `kanji_variants(3)={三}`, `kanji_variants(1000000)={百万}` を確認）。「百万円を超える」は STRICT `>`（`fineFloor < 3*tax`）、「百万円を超え」は STRICT 下限、「三倍以下」は INCLUSIVE 上限。`source_literals_verified({3,1000000}, art)` = True → CONFIRMED。
- 境界（≥3 カテゴリ）: 原文の 1,000,000 を基準に below: 999,999 → false；at: 1,000,000 → false（超えは strict）；above: 1,000,001 → true。tax 側は 3*333,333=999,999（適用せず）/ 3*333,334=1,000,002（適用）。上限 1,000,002 inclusive、over-cap 1,000,003 excluded。by-decide 例を Python で全件シミュレーションし矛盾 0 → CONFIRMED。
- 検出器: `independent_spec_ok` True（spec は独自定数 `specFloor` / `specMult` で各式を自前記述、spec 式に impl 識別子 `fineUpper` / `fineFloor` / `rangeApplies` / `fineWithinRange` なし）、`spec_literals` = {3, 1000000}（原文の 三 / 百万 と一致）、`boundary_evidence_categories` ≥3（below / at / above ほか zero / small_input / saturation）、`source_literals_verified` True → CONFIRMED。
- 橋渡し（厳密な証明、axiom-free）:
  ```
  theorem agree_applies (tax : Nat) : rangeApplies tax = specApplies tax := by
    unfold rangeApplies fineUpper fineFloor specApplies specMult specFloor
    rfl
  theorem agree_within (fine tax : Nat) : fineWithinRange fine tax = specWithin fine tax := by
    unfold fineWithinRange fineUpper fineFloor specWithin specMult specFloor
    rfl
  ```
  純粋な `unfold ... ; rfl` のみ。定数を展開すると spec 式は impl 式と定義的に同一項になり反射で閉じる。by_cases / omega / Classical.choice / 追加公理なし → CONFIRMED。
- 範囲外: 「情状により」の裁量、犯罪成立要件、拘禁刑・前項の百万円以下の罰金、他項・他条項・他法律、徴収手続は NOT MODELLED。

判定: BY-DESIGN / CONFIRMED（原文の明示的数値レンジ「三倍が百万円を超え、百万円を超え三倍以下」のみをモデル化。全 H で通過）。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第二十三条 2 段落目「還付金相当額の三倍が百万円を超え、百万円を超え当該相当額の三倍以下」の明示的数値レンジ（2 アンカー 3 と 1,000,000）のみ。
- T（逐語性）: 自前再抽出の needle が当該 Article 内に verbatim 1 回。SHA-256 は生バイトから再計算し pin と一致。
- D（導出）: 三倍=3, 百万円=1,000,000; 超える/超え = strict, 以下 = inclusive。impl は `decide (fineFloor < fineUpper tax)` / `decide (fineFloor < fine && fine <= fineUpper tax)`、spec は独自定数で同型に記述。
- C（整合）: 333,333→false / 333,334→true; 1,000,000→false / 1,000,001→true / 上限 true / over-cap false。impl↔spec 一致を普遍定理 `agree_applies` / `agree_within`（純 rfl）で確認、矛盾 0。
- U（範囲外）: 裁量・成立要件・拘禁刑・前項罰金・他条項・他法律・徴収手続は NOT MODELLED。

補正記録（いずれも BY-DESIGN / CONFIRMED）:
1. 名称: 見出し「還付金等罰則」/ 指示文「租税特別措置法に関する法律」→ 正式名称「輸入品に対する内国消費税の徴収等に関する法律」（source の `law_title` に準拠）。見出しは指示どおり維持。
2. Revision: `330AC0000000037_20260401_508AC0000000012` を current-enforced として pin、全メタデータ整合（差し替え不要）。
3. 注記: 本記録は機械的検証（worktree 外での再抽出・SHA-256 再計算・検出器実行・by-decide 例の Python シミュレーション）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING; mechanical, not human review）。
