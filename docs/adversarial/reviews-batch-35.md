### PolyesterStapleFiberSpecs.lean — ポリエステル短繊維に対して課する不当廉売関税に関する政令 第一条

- 独立再抽出: doc-comment / transcription_audit.py / impl・spec・tests を一切信用せず、worktree 外 `D:\CodexData\Temp\_adv35_extract.py` の使い捨て Python が pinned 生 JSON を直接読み、自前 walker で `tag=Article` & `attr.Num="1"` を定位・正規化（`[\s\u3000]+` 除去）。実行後に一時スクリプトは削除済み。
- 一次資料: `data/raw/414CO0000000262_20110401_423CO0000000088.law.json`（law 414CO0000000262, revision 414CO0000000262_20110401_423CO0000000088, 政令, 平成十四年政令第二百六十二号, caption （課税物件））。
- SHA-256 再計算: `fcfc53577dfbe461896f26630df965f9dac64266a269ba4502bfe019a9bba874`（raw bytes 15184, CRLF 正規化後も同一）。
- Article 定位: `Num="1"` を 4 件検出。needle を含む 433 文字の正規化スコープ本文を 1 件のみ定位（他 3 件は 31/31/32 文字で needle なし）。誤定位なし。
- 逐語照合: needle「法の別表第五五〇三・二〇号に掲げる合成繊維の短繊維（三・八八デシテックスを超え二十二・二三デシテックス未満のもので、かつ、長さが二十五ミリメートル以上八十ミリメートル以下のものに限る。以下「ポリエステル短繊維」という。）」は正規化スコープ本文に verbatim 1 回存在（外側の 「」 は引用符で原文バイトではない）。読点・漢字を一字一句保持。
- 数値再計算（自前 kanji 十進パーサ）: 三・八八→3.88 dtex→×100=388, 二十二・二三→22.23 dtex→×100=2223, 二十五→25 mm, 八十→80 mm。超え/未満=strict `<`/`>`, 以上/以下=inclusive `<=`/`>=`。二軸は次元が異なる（dtex 対 mm）ため混用しない。
- 境界例 ≥3（自前再計算）: fineness 388→false（超え）, 389→true, 1000→true, 2222→true, 2223→false（未満）; length 24→false, 25→true（以上）, 80→true（以下）, 81→false; combined (389,25)→true, (2223,80)→false。impl 期待値と全一致、矛盾 0。
- 検出器: `independent_spec_ok` True（独立定数 specFLow/specFHigh/specLLow/specLHigh・独立演算子 `>`/`>=`、impl 識別子なし。普遍定理 agree_* が omega でカーネル橋渡し）、`boundary_evidence_categories` = {zero, small_input, saturation}、`spec_literals` = {388, 2223, 25, 80}、`source_literals_verified(spec_literals, scoped)` True（三・八八 / 二十二・二三 / 二十五 / 八十 を認識）、`review_ok` True。

判定: BY-DESIGN / CONFIRMED（原文の明示的な二つの物理的境界条件のみをモデル化。別表第五五〇三・二〇号の分類、原産国・地域、不当廉売の認定、周辺条項・附則の法的判断は範囲外）。全 H で通過。

H/T/D/C/U（独立レビュー記録）:
- H（原条項）: 第一条の「三・八八デシテックスを超え二十二・二三デシテックス未満」かつ「長さが二十五ミリメートル以上八十ミリメートル以下」の二条件のみ。
- T（逐語性）: 自前再抽出の needle が正規化スコープ本文に verbatim 1 回存在。SHA-256 は生バイトから再計算。
- D（導出）: 3.88→388, 22.23→2223（×100, 浮動小数点数なし）, 25/80（mm）。超え/未満→strict, 以上/以下→inclusive。独立 spec は被演算子・演算子を入れ替え、普遍 omega 定理のみでカーネル橋渡し。
- C（整合）: zero/small, 388/389/2222/2223/1000, 24/25/80/81, combined, Nat identity/saturation, impl↔spec 一致を全て `by decide`/`rfl`/定理適用。境界 388 除外・2223 除外・25 採用・80 採用を確認。
- U（範囲外）: 別表の貨物分類、原産国・地域、生産者・輸出者の指定、ダンピング認定、課税期間・税率、他の条項・附則、実数・負の値（Nat 前提）は NOT MODELLED。

注記: 本記録は機械的検証（worktree 外での再抽出・再計算・検出器実行）の結果であり、人間の法解釈レビューではない（LEGAL_REVIEW_PENDING）。
