### TaxAccountantExamExemption.lean

Source: law 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053, raw snapshot `data/raw/326AC1000000237_20251001_505AC0000000053.law.json`.
独立再抽出: the clause below was re-extracted programmatically from the pinned
raw snapshot (not copied from the implementation or spec) and compared
character-by-character with the queue unit text.

> 前項第一号又は第四号から第九号までに規定する職又は事務のうち、試験の免除科目を同じくする職又は事務の二以上に従事した者に対しては、それぞれ当該職又は事務についてこれらの号に規定する年数を十年とする割合により年数を換算してこれらの職又は事務の二以上に従事した期間を通算した場合に、その期間が十年以上になるときは、その申請により、税理士試験において当該科目の試験を免除する。

H/T/D/C/U: H（各職務の規定年数・換算年数・通算十年を別記録）T（9/10/11 年と
5年→10年換算を kernel-decided examples で検査）D（原文の「十年とする割合」と
「十年以上になるとき」を独立照合し、職務・科目認定は対象外と明示）
C（impl は割合除算と <=、spec は非負ガードと not (<) で独立定式化）
U（対象職務・免除科目の認定、三以上の職務、端数詳細、申請手続は
NOT MODELLED。有限 grid の一致は普遍的正しさを意味しない）

判定: 照合 — pinned clause and independently re-extracted text agree verbatim;
the modelled aggregation agrees on the kernel-decided grid. Transcription/scope
finding only. 人間による法的レビューは LEGAL_REVIEW_PENDING であり、
本記録は承認や法的正しさの証明ではない。
