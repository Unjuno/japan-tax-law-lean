/-\!
# TemporalApplicationRulesSpec — 独立形式仕様

pinned 原文（新旧法の時間的適用と付随規範 808条片）から独立に読み取った仕様。
実装を import しない。

新法は施行日以后、旧法は施行日前にのみ適用され、両者は排他的かつ全域的。
施行前行為の罰則は旧法による。時効は本罪に従う。該当日以后の適用はtrigger <= date。
経過措置の内容・代表者・証明書類・参照先は外部が与える。
具体的な日付・納税者・犯罪・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.TemporalApplicationRulesSpec

def newLawSpec (d e : Nat) : Prop := e <= d
def oldLawSpec (d e : Nat) : Prop := d < e
def priorPenaltySpec (a e : Nat) : Prop := a < e
def fromDateSpec (d t : Nat) : Prop := t <= d
def limitationSpec (p : Nat) : Nat := p
def delegatedSpec (c : Nat) : Nat := c
def studyDirectiveSpec : Prop := True
def certificationSpec : Prop := True
def specialLimitSpec (t : Nat) : Nat := t
def caseIndexSpec (i : Nat) : Nat := i

end JapanTaxLaw.TemporalApplicationRulesSpec
