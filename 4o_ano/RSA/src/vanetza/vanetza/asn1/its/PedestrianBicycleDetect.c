/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "DSRC"
 * 	found in "build.asn1/iso/ISO19091.asn"
 * 	`asn1c -fcompound-names -fincludes-quoted -no-gen-example -R`
 */

#include "PedestrianBicycleDetect.h"

/*
 * This type is implemented using BOOLEAN,
 * so here we adjust the DEF accordingly.
 */
static const ber_tlv_tag_t asn_DEF_PedestrianBicycleDetect_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (1 << 2))
};
asn_TYPE_descriptor_t asn_DEF_PedestrianBicycleDetect = {
	"PedestrianBicycleDetect",
	"PedestrianBicycleDetect",
	&asn_OP_BOOLEAN,
	asn_DEF_PedestrianBicycleDetect_tags_1,
	sizeof(asn_DEF_PedestrianBicycleDetect_tags_1)
		/sizeof(asn_DEF_PedestrianBicycleDetect_tags_1[0]), /* 1 */
	asn_DEF_PedestrianBicycleDetect_tags_1,	/* Same as above */
	sizeof(asn_DEF_PedestrianBicycleDetect_tags_1)
		/sizeof(asn_DEF_PedestrianBicycleDetect_tags_1[0]), /* 1 */
	{
#if !defined(ASN_DISABLE_OER_SUPPORT)
		0,
#endif  /* !defined(ASN_DISABLE_OER_SUPPORT) */
#if !defined(ASN_DISABLE_UPER_SUPPORT) || !defined(ASN_DISABLE_APER_SUPPORT)
		0,
#endif  /* !defined(ASN_DISABLE_UPER_SUPPORT) || !defined(ASN_DISABLE_APER_SUPPORT) */
		BOOLEAN_constraint
	},
	0, 0,	/* No members */
	0	/* No specifics */
};

