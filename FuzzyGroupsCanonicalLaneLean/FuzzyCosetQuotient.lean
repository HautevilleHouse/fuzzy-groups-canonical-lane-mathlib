import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyCosetQuotient {G : Type u} [Group G] (F : FuzzySubgroupMembership G)
    (N : FuzzyNormalSubgroup F) where
  fuzzyCoset : G → FuzzySetMembership G
  fuzzyQuotientGroup : Group (FuzzySetMembership G)
  quotientWellDefined : Prop

structure FuzzyCosetQuotientEvidence {G : Type u} [Group G]
    {F : FuzzySubgroupMembership G} {N : FuzzyNormalSubgroup F}
    (Q : FuzzyCosetQuotient F N) where
  quotientWellDefinedClosed : Q.quotientWellDefined

def FuzzyCosetQuotientClosed {G : Type u} [Group G]
    {F : FuzzySubgroupMembership G} {N : FuzzyNormalSubgroup F}
    (Q : FuzzyCosetQuotient F N) : Prop :=
  Q.quotientWellDefined

theorem fuzzy_coset_quotient_closed_from_evidence {G : Type u} [Group G]
    {F : FuzzySubgroupMembership G} {N : FuzzyNormalSubgroup F}
    (Q : FuzzyCosetQuotient F N) (E : FuzzyCosetQuotientEvidence Q) :
    FuzzyCosetQuotientClosed Q :=
  E.quotientWellDefinedClosed

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse