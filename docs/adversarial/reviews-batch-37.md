# Adversarial review — batch 37

### DependentAgeSupport.lean — 国際連合軍隊地位協定臨時特例法 第二条

- 方法: 独立再抽出。使い捨て Python を D:\CodexData\Temp に置き、pinned raw JSON を直接読み、実行後に削除した。doc-comment と transcription_audit.py は信じず、原文のみから再計算した。
- SHA-256 再計算: cb970b2673e9c788e414eca62f92a630d2acce975cda1233251834b874e653a6 (raw bytes; CRLF 正規化後も同一) → CONFIRMED。
- 構造走査: law_full_text を再帰し `tag == "Article"` かつ `attr.Num == "2"` を検出; 最初の記事 (flat + 空白除去で 560 文字) に対象規定あり → CONFIRMED。
- needle 照合: 原文 102 文字（空白除去）が scoped text に逐語存在 → CONFIRMED（判定: FOUND）。
- 数詞再計算: 二十一 = 21, 十分の五 = 5/10 (one half)。未満 STRICT / 以上 INCLUSIVE。impl と spec の 21, 5, 10 と一致 → CONFIRMED。
- 境界照合 (>=3): age 20 -> true; age 21 -> false; 500/1000 -> true (5/10 以上は含有); 499/1000 -> false; total 0 -> false → CONFIRMED。
- H/T/D/C/U: H（原文の数詞は二十一・十分の五のみ; 配偶者・父母branch に数字なし）= CONFIRMED / T（21 と 5/10 を 21,5,10 の交叉乗算で表現）= CONFIRMED / D（未満 STRICT と 以上 INCLUSIVE を分離）= CONFIRMED / C（10*b >= 5*t と 5*t <= 10*b は同値; omega が普遍 bridge）= CONFIRMED / U（配偶者・父母・日本国内にある間・他条・政令）= BY-DESIGN 範囲外。
- 判定: 数値・境界・来源は全て CONFIRMED、スコープ外項目は BY-DESIGN。これは機械的再抽出であり人間のレビューではない (mechanical, not human review)。
