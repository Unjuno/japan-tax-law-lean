### LeaseholdLandShare.lean

Source: law 403AC0000000069, revision 403AC0000000069_20250601_504AC0000000068, raw snapshot `data/raw/403AC0000000069_20250601_504AC0000000068.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 借地権等が設定されている場合において、当該土地等が借地権等以外のもの（以下この号において「底地」という。）であるとき。　三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額

H/T/D/C/U: H（底地価額・更地価額・割合・三万円を別記録）T（零・同値・
半分・1/3 を kernel-decided examples で検査）D（原文の「三万円に...
割合を乗じて計算した金額」を独立照合し、価額評価は対象外と明示）
C（impl は単一の乗算除算、spec は商と剰余の分解で独立定式化）U（借地権
設定・底地認定・価額評価・端数詳細は NOT MODELLED。有限 grid の一致は
普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled calculation agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
