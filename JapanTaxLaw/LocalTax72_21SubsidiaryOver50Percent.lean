import JapanTaxLaw.TaxFinance

/-
# LocalTax72_21SubsidiaryOver50Percent — pinned clause 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_21, paragraph 6, item 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|9585c06b7331519b5cba1e368ae5033d97b6f08ec8aecf88ed25d7b1fc3883dd.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_21/Article#72_21/Paragraph#6/Item#2/ItemSentence/Sentence#1.
原文逐語: 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」
Scope: ONLY the 百分の五十を超える STRICT holding-ratio floor (percent > 50). 特定子会社の定義の他の部分, 解散法人の規定, 帳簿価額の合計額の算定, 他の号, 他条項 are NOT MODELLED. The single-literal 百分のN floor is used because N/100 = 50/100 is exactly the clause rate.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (50), STRICT lower bound. -/
def threshold : Nat := 50

/-- 「当該内国法人の当該事業年度終了の時又は当該事業年度の前事業年度終了の時における特定子会社（当該内国法人が発行済株式又は出資（政令で定めるものを除く。）の総数又は総額の百分の五十を超える数の株式又は出資を直接又は間接に保有する他の法人をいう。）の株式又は出資で、それぞれの時において当該内国法人が保有するものの帳簿価額の合計額」. -/
def inScope (percent : Nat) : Prop := threshold < percent

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (percent : Nat) : Bool := decide (50 < percent)

end JapanTaxLaw.LocalTax72_21SubsidiaryOver50Percent
