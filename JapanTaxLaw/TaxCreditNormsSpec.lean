/-\!
# TaxCreditNormsSpec — 独立形式仕様

pinned 原文（外国税額控除・控除残額・配当控除 173条片）から独立に読み取った仕様。
実装を import しない。

控除適用は min(tax,credit)、控除しきれない額は credit-tax（超過分）、配当控除は
dividend*rate。具体的な金額は NOT MODELLED。
-/
namespace JapanTaxLaw.TaxCreditNormsSpec

def creditSpec (t c : Nat) : Nat := if c <= t then c else t
def unusedSpec (t c : Nat) : Nat := c - t
def dividendSpec (d r : Nat) : Nat := d * r

end JapanTaxLaw.TaxCreditNormsSpec
