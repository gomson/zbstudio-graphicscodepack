-- Copyright (C) 2008-2017 Christoph Kubisch. All rights reserved.
---------------------------------------------------------

-- function helpers

local function fn (description) 
	local description2,returns,args = description:match("(.+)%-%s*(%b())%s*(%b())")
	if not description2 then
		return {type="function",description=description,
			returns="(?)"} 
	end
	return {type="function",description=description2,
		returns=returns:gsub("^%s+",""):gsub("%s+$",""), args = args} 
end

local function val (description)
	return {type="value",description = description}
end
-- docs
local api = {
radians = fn "converts degrees to radians - (vecN)(vecN)",
degrees = fn "converts radians to degrees - (vecN)(vecN)",
sin = fn "returns sine of scalars and vectors. - (vecN)(vecN)",
sinh = fn "returns hyperbolic sine of scalars and vectors. - (vecN)(vecN)",
cos = fn "returns cosine of scalars and vectors.  - (vecN)(vecN)",
cosh = fn "returns hyperbolic cosine of scalars and vectors. - (vecN)(vecN)",
atan = fn "returns arc tangent of scalars and vectors. - (vecN)([vecN y_over_x ]/[vecN y, vecN x])",
asin = fn "returns arc sine of scalars and vectors. - (vecN)(vecN)",
acos = fn "returns arc cosine of scalars and vectors. - (vecN)(vecN)",
atan = fn "returns arc tangent of scalars and vectors. - (vecN)(vecN)",
tan = fn "returns tangent of scalars and vectors. - (vecN)(vecN)",
tanh = fn "returns hyperbolic tangent of scalars and vectors. - (vecN)(vecN)",
acosh = fn "returns hyperbolic arc cosine of scalars and vectors. - (vecN)(vecN)",
asinh = fn "returns hyperbolic arc sine of scalars and vectors. - (vecN)(vecN)",
atanh = fn "returns hyperbolic arc tangent of scalars and vectors. - (vecN)(vecN)",

exp = fn "returns the base-e exponential of scalars and vectors. - (vecN)(vecN)",
exp2 = fn "returns the base-2 exponential of scalars and vectors. - (vecN)(vecN)",
log = fn "returns the natural logarithm of scalars and vectors. - (vecN)(vecN)",
log2 = fn "returns the base-2 logarithm of scalars and vectors. - (vecN)(vecN)",
pow = fn "returns x to the y-th power of scalars and vectors. - (vecN)(vecN x, y)",
sqrt = fn "returns square root of scalars and vectors. - (vecN)(vecN)",
inversesqrt = fn "returns inverse square root of scalars and vectors. - (vecN)(vecN)",

abs = fn "returns absolute value of scalars and vectors. - (vecN)(vecN)",
sign = fn "returns sign (1 or -1) of scalar or each vector component. - (vecN)(vecN)",
floor = fn "returns largest integer not greater than a scalar or each vector component. - (vecN)(vecN)",
ceil = fn "returns smallest integer not less than a scalar or each vector component.  - (vecN)(vecN)",
trunc = fn "returns largest integer not greater than a scalar or each vector component. - (vecN)(vecN)",
round = fn "returns the rounded value of scalars or vectors. - (vecN)(vecN a)",
roundEven = fn "returns the nearest even integer value of scalars or vectors. - (vecN)(vecN a)",
fract = fn "returns the fractional portion of a scalar or each vector component.  - (vecN)(vecN)",
mod = fn "modulus - (vecN)(vecN x, y)",
modf = fn "separate integer and fractional parts. - (vecN)(vecN x, out vecN i)",
max = fn "returns the maximum of two scalars or each respective component of two vectors. - (vecN)(vecN a, b)",
min = fn "returns the minimum of two scalars or each respective component of two vectors. - (vecN)(vecN a, b)",
mix = fn "returns linear interpolation of two scalars or vectors based on a weight. - (vecN)(vecN a, b, weight)",
step = fn "implement a step function returning either zero or one (x >= edge). - (vecN)(vecN edge, x)",

isinf = fn "test whether or not a scalar or each vector component is infinite. - (boolN)(vecN)",
isnan = fn "test whether or not a scalar or each vector component is not-a-number. - (boolN)(vecN)",
clamp = fn "returns x clamped to the range [a,b]. - (vecN)(vecN x, a, b)",
smoothstep = fn "clip and smooth blend [a,b]. - (vecN)(vecN a, b, x)",
floatBitsToInt = fn "returns the 32-bit integer representation of an IEEE 754 floating-point scalar or vector - (uintN/intN)(floatN)",
intBitsToFloat = fn "returns the float value corresponding to a given bit represention.of a scalar int value or vector of int values. - (floatN)(intN)",
uintBitsToFloat = fn "returns the float value corresponding to a given bit represention.of a scalar int value or vector of int values. - (floatN)(uintN)",
doubleBitsToInt64 = fn "returns the 64-bit integer representation of an IEEE 754 double precision floating-point scalar or vector - (int64N)(doubleN)",
doubleBitsToUint64 = fn "returns the 64-bit integer representation of an IEEE 754 double precision floating-point scalar or vector - (uint64N)(doubleN)",
int64BitsToDouble =  fn "returns the double value corresponding to a given bit represention.of a scalar int value or vector of int values. - (doubleN)(uint64N)",
uint64BitsToDouble =  fn "returns the double value corresponding to a given bit represention.of a scalar int value or vector of int values. - (doubleN)(uint64N)",

fma = fn "return a*b + c, treated as single operation when using precise - (vecN a, vecN b, vecN c)",
frexp = fn "splits scalars and vectors into normalized fraction [0.5,1.0) and a power of 2. - (vecN)(vecN x, out vecN e)",
ldexp = fn "build floating point number from x and the corresponding integral exponen of 2 in exp. - (vecN)(vecN x, exp)",

packUnorm2x16 = fn "Converts each comp. of v into 16-bit ints, packs results into the returned 32-bit uint. - (uint)(vec2 v)",
packUnorm4x8 = fn "Converts each comp. of v into 8-bit ints, packs results into the returned 32-bit uint. - (uint)(vec4 v)",
packSnorm4x8 = fn "Converts each comp. of v into 8-bit ints, packs results into the returned 32-bit uint. - (uint)(vec4 v)",
packDouble2x32 = fn "Packs components of v into a 64-bit value and returns a double-prec value. - (double)(uvec2 v)",
packHalf2x16 = fn "Converts each comp. of v into 16-bit half float, packs results into the returned 32-bit uint. - (uint)(vec2 v)",
packInt2x32 = fn "Packs two 32 bit into one 64-bit value. - (int64_t)(ivec2)",
packUint2x32 = fn "Packs two 32 bit into one 64-bit value. - (uint64_t)(uvec2)",
packFloat2x16 = fn "returns an unsigned integer obtained by interpreting the components of a two-component 16-bit floating-point as integers and packing them into 32 bit. - (uint)(f16vec2  v)",

unpackUnorm2x16 = fn "Unpacks 32-bit p into two 16-bit uints and converts them to normalized float. - (vec2)(uint p)",
unpackUnorm4x8 = fn "Unpacks 32-bit p into four 8-bit uints and converts them to normalized float. - (vec4)(uint p)",
unpackSnorm4x8 = fn "Unpacks 32-bit p into four 8-bit uints and converts them to normalized float. - (vec4)(uint p)",
unpackDouble2x32 = fn "Returns a 2 component vector representation of v. - (uvec2)(double v)",
unpackHalf2x16 = fn "Interprets p as two 16-bit half floats and returns them as vector. - (vec2)(uint p)",
unpackInt2x32  = fn "Unpacks 64-bit into two 32-bit values. - (ivec2)(int64_t)",
unpackUint2x32 = fn "Unpacks 64-bit into two 32-bit values. - (uvec2)(uint64_t)",
unpackFloat2x16 = fn "returns a two-component vector with 16-bit floating-point components obtained by unpacking a 32-bit unsigned integer into a pair of 16-bit values. - (f16vec2)(uint)",


length = fn "return scalar Euclidean length of a vector. - (type)(vecN)",
distance = fn "return the Euclidean distance between two points. - (vecN)(vecN a, b)",
dot = fn "returns the scalar dot product of two vectors. - (type)(vecN a, b)",
cross = fn "returns the cross product of two three-component vectors. - (type3)(type3 a, b)",
normalize = fn "Returns the normalized version of a vector, meaning a vector in the same direction as the original vector but with a Euclidean length of one. - (vecN)(vecN)",
reflect = fn "returns the reflectiton vector given an incidence vector and a normal vector. - (vecN)(vecN incidence, normal)",
refract = fn "computes a refraction vector. - (vecN)(vecN incidence, normal, type eta)",
faceforward = fn "dot(Nreference, incident) < 0 returns N, otherwise it returns -N. - (vecN)(vecN N, incident, Nreference)",

determinant = fn "returns the scalar determinant of a square matrix. - (float)(matN)",
transpose = fn "returns transpose matrix of a matrix. - (matNxM)(matMxN)",
inverse = fn "returns inverse matrix of a matrix. - (matN)(mat)",
matrixCompMult = fn "component-wise multiply. - (mat)(mat a, b)",
outerProduct = fn "outer product. - (matNxM)(vecM c, vecN r)",

all = fn "returns true if a boolean scalar or all components of a boolean vector are true. - (bool)(boolN)",
any = fn "returns true if a boolean scalar or any component of a boolean vector is true.  - (bool)(boolN)",
["not"] = fn "returns logical complement. - (boolN)(boolN)",
lessThan = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",
lessThanEqual = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",
greaterThan = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",
greaterThanEqual = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",
equal = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",
notEqual = fn "returns  retusult of component-wise comparison. - (boolN)(vecN a,b)",

uaddCarry = fn "Adds 32-bit uintx and y, returning the sum modulo 2^32. - (uintN)(uintN x, y, out carry)",
usubBorrow = fn "Subtracts y from x, returning the difference if non-negative otherwise 2^32 plus the difference. - (uint)(uint x, y, out  borrow)",
umulExtended = fn "Multiplies 32-bit integers x and y producing 64-bit result. (uintN)(uintN x, y, out msb, out lsb)",
imulExtended = fn "Multiplies 32-bit integers x and y producing 64-bit result. (intN)(intN x, y, out msb, out lsb)",
bitfieldExtract = fn "Extracts bits (offset, offset + bits -1) from value and returns them in lsb of result.  - (intN)(intN value, int offset, int bits)",
bitfieldInsert = fn "Returns the insertion the bits lsb of insert into base. - (intN)(intN base, insert, int offset, int bits)",
bitfieldReverse = fn "Returns the reversal of the bits. - (intN)(intN)",
bitCount = fn "returns the number of bits set to 1. - (intN)(intN)",
findLSB = fn "returns bit number of lsb. - (intN)(intN)",
findMSB = fn "returns bit number of msb. - (intN)(intN)",

discard = fn "conditionally (<0) kill a pixel before output. - ()(vecN)",
dFdx = fn "returns approximate partial derivative with respect to window-space X. - (vecN)(vecN)",
dFdxCoarse = fn "returns approximate partial derivative with respect to window-space X. - (vecN)(vecN)",
dFdxFine = fn "returns approximate partial derivative with respect to window-space X. - (vecN)(vecN)",
dFdy = fn "returns approximate partial derivative with respect to window-space Y. - (vecN)(vecN)",
dFdyCoarse = fn "returns approximate partial derivative with respect to window-space Y. - (vecN)(vecN)",
dFdyFine = fn "returns approximate partial derivative with respect to window-space Y. - (vecN)(vecN)",
fwidth = fn "returns abs sum of approximate window-space partial derivatives magnitudes. - (vecN)(vecN)",
fwidthFine = fn "returns abs sum of approximate window-space partial derivatives magnitudes. - (vecN)(vecN)",
fwidthCoarse = fn "returns abs sum of approximate window-space partial derivatives magnitudes. - (vecN)(vecN)",
interpolateAtCentroid = fn "Return value of interpolant sampled inside pixel and the primitive. - (floatN)(floatN)",
interpolateAtSample = fn "Return value of interpolant at the location fo sample. - (floatN)(floatN, int sample)",
interpolateAtOffset = fn "Return value of interpolant sampled at fixed offset offset from pixel center. - (floatN)(floatN, vec2 offset)",

EmitStreamVertex = fn "Emits values of the output variables of the current output primitive stream. - ()(int stream)",
EndStreamPrimitive = fn "Completes current output primitive stream and starts a new one. - ()(int stream)",
EmitVertex= fn "Emits values of the output variable of the current output primitive. - ()()",
EndPrimitive = fn "Completes current output primitive and starts a new one. - ()()",
barrier = fn "Synchronizes across shader invocations. - ()()",

memoryBarrier = fn "control ordering of memory transactions issued by shader thread. - ()()",
memoryBarrierAtomicCounter = fn "control ordering of memory transactions issued by shader thread. - ()()",
memoryBarrierShared = fn "control ordering of memory transactions issued by shader thread. - ()()",
memoryBarrierBuffer = fn "control ordering of memory transactions issued by shader thread. - ()()",
memoryBarrierImage = fn "control ordering of memory transactions issued by shader thread. - ()()",
groupMemoryBarrier = fn "control ordering of memory transactions issued by shader thread. - ()()",
imageAtomicAdd = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicMin = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicMax = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicIncWrap = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicDecWrap = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicAnd = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicOr = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicXor = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicExchange = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageAtomicCompSwap = fn "performs atomic operation on individual texels returns old value. - (uint)(imageN, intN coord, [int sample], uint data)",
imageStore = fn "stores the texel at the coordinate. - ()(imageN, intN coord, [int sample], vecN data)",
imageLoad = fn "loads the texel at the coordinate. - (vecN)(imageN, intN coord, [int sample])",
imageSize = fn "returns the size of the image. - (ivecN)(imageN)",
imageSamples = fn "returns the samples of the multi-sampled image. - (int)(image2DMS)",

atomicCounterIncrement = fn "increments counter and returns old value. - (uint)(atomic_uint)",
atomicCounterDecrement = fn "decrements counter and returns old value. - (uint)(atomic_uint)",
atomicCounter = fn "returns current counter value. - (uint)(atomic_uint)",
atomicMin = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicMax = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicAdd = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicAnd = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicOr  = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicXor = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicExchange = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",
atomicCompSwap = fn "performs atomic operation on memory location (ssbo/shared) returns old value. - (uint)(inout uint mem, uint data)",

texelFetch = fn "integer coordinate lookup for a single texel. No lod parameter for Buffer, MS, Rect. Illegal for Cube - (vec4)(samplerN, intN coord, [int lod/sample])",
texelFetchOffset = fn "integer coordinate lookup for a single texel with offset. No lod parameter for Buffer, MS, Rect. Illegal for Cube, Buffer, MS. - (vec4)(samplerN, intN coord, [int lod/sample], intN offset)",
texture = fn "performs a texture lookup. Shadow samplers require base N+1 coordinate.  Lod bias is optional (illegal for MS, Buffer, Rect). - (vec4)(samplerN, vecN coord, [float bias])",
textureGather = fn "gather lookup (pixel quad of 4 single channel samples at once). Component 0: x, 1: y ... is ignored for shadow samplers instead reference value must be passed. Only 2D/Cube. Illegal for MS. - (vec4)(samplerN, vecN coord, [int comp] / float shadowRefZ)",
textureGatherOffset = fn "gather lookup (pixel quad of 4 single channel samples at once) with offset. Component 0: x, 1: y ... is ignored for shadow samplers instead reference value must be passed. Only 2D/Cube. Illegal for MS. - (vec4)(samplerN, vecN coord, [float shadowRefZ], intN offset, [int comp])",
textureGatherOffsets = fn "gather lookup (pixel quad of 4 single channel samples at once) with offset. Component 0: x, 1: y ... is ignored for shadow samplers instead reference value must be passed. Only 2D/Cube. Illegal for MS. - (vec4)(samplerN, vecN coord, [float shadowRefZ], intN offsets[4] , [int comp])",
textureGrad = fn "lookup with explicit gradients. Illegal for MS, Buffer. - (vec4)(samplerN, vecN coord, gradX, gradY)",
textureGradOffset = fn "lookup with explicit gradients and offset. Illegal for MS, Buffer, Cube. - (vec4)(samplerN, vecN coord, gradX, gradY, intN offset)",
textureLod = fn "performs a lookup with explicit LOD. Shadows require N+1 base coordinate. Illegal function for Rect, MS, Buffer. - (vec4)(samplerN, vecN coord, float lod)",
textureLodOffset = fn "offset added with explicit LOD. - (vec4)(samplerN, vecN coord, intN offset, int lod)",
textureOffset = fn "offset added before texture lookup. Illegal for MS, Buffer, Cube. - (vec4)(samplerN, vecN coord, intN offset, [float bias])",
textureProj = fn "performs a projective texture lookup (only Nd samplers + Rect). Shadows require N+1 base coordinate, no Lod bias allowed for Rect. - (vec4)(samplerN, vecN+1 coord, [float bias])",
textureProjGrad = fn "performs a projective texture lookup with explicit gradients (only Nd samplers + Rect). Shadows require N+1 base coordinate, no Lod bias allowed for Rect. - (vec4)(samplerN, vecN+1 coord, vecN gradX, gradY)",
textureProjGradOffset = fn "projective lookup with explicit gradients and offset. Illegal for MS, Buffer, Cube. - (vec4)(samplerN, vecN+1 coord, vecN gradX, gradY, intN offset)",
textureProjLod = fn "performs a projective texture lookup with explicit LOD (only Nd samplers). Shadows require N+1 base coordinate. - (vec4)(samplerN, vecN+1 coord, float lod)",
textureProjLodOffset = fn "projective lookup with offset and explicit LOD. - (vec4)(samplerN, vecN+1 coord, intN offset, int lod)",
textureProjOffset = fn "projective texture lookup with offset. Illegal for MS, Buffer, Cube, Array. - (vec4)(samplerN, vecN+1 coord, intN offset, [float bias])",
textureQueryLevels = fn "returns the number of accessible mipmap levels of a texture. - (int)(samplerN)",
textureQueryLod = fn "returns the lod values for a given coordinate. - (vec2)(samplerN, vecN coord)",
textureSamples = fn "returns the samples of the multi-sampled texture. - (int)(texture2DMSN)",
textureSize = fn "returns the size of the texture (no lod required: Rect, MS and Buffer). - (intN)(samplerN, [int lod])",


anyInvocationARB = fn "returns true if and only if <value> is true for at least one active invocation in the group. - (bool)(bool value)",
allInvocationsARB = fn "returns true if and only if <value> is true for all active invocations in the group - (bool)(bool value)",
allInvocationsEqualARB = fn "returns true if <value> is the same for all active invocation in the group. - (bool)(bool value)",

packPtr = fn "returns pointer from uvec2. - (void*)(uvec2)",
unpackPtr = fn "return uvec2 from pointer. - (uvec2)(void*)",

anyThreadNV = fn "returns true if and only if <value> is true for at least one active invocation in the group. - (bool)(bool value)",
allThreadsNV = fn "returns true if and only if <value> is true for all active invocations in the group - (bool)(bool value)",
allThreadsEqualNV = fn "returns true if <value> is the same for all active invocation in the group. - (bool)(bool value)",

activeThreadsNV = fn "sets ith bit for every active thread in warp - (uint)()",
ballotThreadNV = fn "sets ith bit for every active thread in warp if true. - (uint)(bool value)",

quadSwizzle0NV = fn "result[thread N] = swizzledValue[thread 0] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",
quadSwizzle1NV = fn "result[thread N] = swizzledValue[thread 1] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",
quadSwizzle2NV = fn "result[thread N] = swizzledValue[thread 2] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",
quadSwizzle3NV = fn "result[thread N] = swizzledValue[thread 3] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",
quadSwizzleXNV = fn "result[thread N] = swizzledValue[thread X neighbor] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",
quadSwizzleYNV = fn "result[thread N] = swizzledValue[thread Y neighbor] + unswizzledValue[thread N]. - (vecN)(vecN swizzledValue, [vecN unswizzledValue])",

shuffleDownNV = fn "result[thread N] = data[thread N + index ]. - (genN)(genN data, uint index, uint width, [out bool threadIdValid])",
shuffleUpNV = fn "result[thread N] = data[thread N - index]. - (genN)(genN data, uint index, uint width, [out bool threadIdValid])",
shuffleXorNV = fn "result[thread N] = data[thread N ^ index]. - (genN)(genN data, uint index, uint width, [out bool threadIdValid])",
shuffleNV = fn "result[thread N] = data[thread index].  - (genN)(genN data, uint index, uint width, [out bool threadIdValid])",

ballotARB = fn "sets ith bit for every active thread in sub group. - (uint64_t)(bool value)",
readInvocationARB = fn "result[thread N] = data[thread index]. - (genN)(genN data, uint index)",
readFirstInvocationARB = fn "result[thread N] = data[thread 0]. - (genN)(genN data)",

clock2x32ARB = fn "current execution clock as seen by the shader processor. - (uvec2)()",
clockARB = fn "current execution clock as seen by the shader processor. - (uint64_t)()",

sparseTexelsResidentARB = fn "false if code represents touching uncommitted texture memory. - (bool)(int code)",
sparseTextureARB = fn " - (int)(gsamplerN sampler, vecN P, out gvec4 texel [, float bias])",
sparseTextureLodARB = fn " - (int)(gsamplerN sampler, vecN P, float lod, out gvec4 texel)",
sparseTextureOffsetARB = fn " - (int)(gsamplerN sampler, vecN P, ivecN offset, out gvec4 texel [, float bias])",
sparseTexelFetchARB = fn " - (int)(gsamplerN sampler, ivecN P, int lod, out gvec4 texel)", 
sparseTexelFetchOffsetARB = fn " - (int)(gsamplerN sampler, ivecN P, int lod, ivecN offset, out gvec4 texel)",
sparseTextureLodOffsetARB = fn " - (int)(gsamplerN sampler, vecN P, float lod, ivecN offset, out gvec4 texel)",
sparseTextureGradARB = fn " - (int)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, out gvec4 texel)",
sparseTextureGradOffsetARB = fn " - (int)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, ivec2 offset, out gvec4 texel)",
sparseTextureGatherARB = fn " - (int)(gsamplerN sampler, vecN P, out gvec4 texel [, int comp])",
sparseTextureGatherOffsetARB = fn " - (int)(gsamplerN sampler, vecN P, ivecN offset, out gvec4 texel [, int comp])",
sparseTextureGatherOffsetsARB = fn " - (int)(gsamplerN sampler, vecN P, ivecN offsets[4], out gvec4 texel [, int comp])",
sparseImageLoadARB = fn " - (int)(gsamplerN image, ivecN P, out gvec4 texel)",
sparseTextureClampARB = fn " - (int)(gsamplerN sampler, vecN P, float lodClamp, out gvec4 texel, [float bias])",
sparseTextureOffsetClampARB = fn " - (int)(gsamplerN sampler, vecN P, ivecN offset, float lodClamp, out gvec4 texel [, float bias])",
sparseTextureGradClampARB = fn " - (int)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, float lodClamp, out gvec4 texel)",
sparseTextureGradOffsetClampARB = fn " - (int)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, ivecN offset, float lodClamp, out gvec4 texel)",
textureClampARB = fn " - (gvec4)(gsamplerN sampler, vecN P, float lodClamp [, float bias])",
textureOffsetClampARB = fn " - (gvec4)(gsamplerN sampler, vecN P, ivecN offset, float lodClamp [, float bias])",
textureGradClampARB = fn " - (gvec4)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, float lodClamp)",
textureGradOffsetClampARB = fn " - (gvec4)(gsamplerN sampler, vecN P, vecN dPdx, vecN dPdy, ivecN offset, float lodClamp)",
}

local keyw = 
[[  
    int uint half float bool double
    vec2 vec3 vec4 dvec2 dvec3 dvec4
    ivec2 ivec3 ivec4 uvec2 uvec3 uvec4 bvec2 bvec3 bvec4
    mat2 mat3 mat4 mat2x2 mat3x3 mat4x4 mat2x3 mat3x2 mat4x2 mat2x4 mat4x3 mat3x4
    dmat2 dmat3 dmat4 dmat2x2 dmat3x3 dmat4x4 dmat2x3 dmat3x2 dmat4x2 dmat2x4 dmat4x3 dmat3x4
    struct void
    subroutine
    
    float16_t f16vec2 f16vec3 f16vec4
    float32_t f32vec2 f32vec3 f32vec4
    float64_t f64vec2 f64vec3 f64vec4
    int8_t i8vec2 i8vec3 i8vec4
    int8_t i8vec2 i8vec3 i8vec4
    int16_t i16vec2 i16vec3 i16vec4
    int32_t i32vec2 i32vec3 i32vec4
    int64_t i64vec2 i64vec3 i64vec4
    uint8_t u8vec2 u8vec3 u8vec4
    uint16_t u16vec2 u16vec3 u16vec4
    uint32_t u32vec2 u32vec3 u32vec4
    uint64_t u64vec2 u64vec3 u64vec4
    
    main
    attribute const uniform varying buffer shared
    coherent volatile restrict readonly writeonly
    atomic_uint
    layout 
    centroid flat smooth noperspective
    patch sample
    break continue do for while switch case default
    if else
    subroutine
    in out inout
    float double int void bool true false
    invariant precise
    discard return
    lowp mediump highp precision
    
    location vertices line_strip triangle_strip max_vertices stream index
    triangles quads equal_spacing isolines fractional_even_spacing lines points
    fractional_odd_spacing cw ccw point_mode lines_adjacency triangles_adjacency
    invocations offset align xfb_offset xfb_buffer
    origin_upper_left pixel_center_integer depth_greater depth_greater depth_greater depth_unchanged
    shared packed std140 std430 row_major column_major
    local_size_x local_size_y local_size_z
    early_fragment_tests
        
    post_depth_coverage
    bindless_sampler bound_sampler bindless_image bound_image
    binding set input_attachment_index
    pixel_interlock_ordered pixel_interlock_unordered sample_interlock_ordered sample_interlock_unordered
    commandBindableNV passthrough secondary_view_offset viewport_relative override_coverage
   
    size1x8 size1x16 size1x32 size2x32 size4x32 rgba32f rgba16f rg32f rg16f r32f r16f rgba8 rgba16 r11f_g11f_b10f rgb10_a2ui
    rgb10_a2i rg16 rg8 r16 r8 rgba32i rgba16i rgba8i rg32i rg16i rg8i r32i r16i r8i rgba32ui rgba16ui rgba8ui rg32ui rg16ui rg8ui
    r32ui r16ui r8ui rgba16_snorm rgba8_snorm rg16_snorm rg8_snorm r16_snorm r8_snorm

    subpassInput isubpassInput usubpassInput
    subpassInputMS isubpassInputMS usubpassInputMS
    
    sampler 
    samplerShadow 
    
    sampler1DShadow sampler2DShadow sampler2DRectShadow samplerCubeShadow sampler1DArrayShadow sampler2DArrayShadow samplerCubeArrayShadow
    
    image1D image2D image3D image2DRect imageCube imageBuffer image1DArray image2DArray imageCubeArray image2DMS image2DMSArray
    uimage1D uimage2D uimage3D uimage2DRect uimageCube uimageBuffer uimage1DArray uimage2DArray uimageCubeArray uimage2DMS uimage2DMSArray
    iimage1D iimage2D iimage3D iimage2DRect iimageCube iimageBuffer iimage1DArray iimage2DArray iimageCubeArray iimage2DMS iimage2DMSArray
    
    texture1D texture2D texture3D textureCube texture2DRect texture1DArray texture2DArray textureBuffer texture2DMS texture2DMSArray textureCubeArray
    utexture1D utexture2D utexture3D utextureCube utexture2DRect utexture1DArray utexture2DArray utextureBuffer utexture2DMS utexture2DMSArray utextureCubeArray
    itexture1D itexture2D itexture3D itextureCube itexture2DRect itexture1DArray itexture2DArray itextureBuffer itexture2DMS itexture2DMSArray itextureCubeArray
    
    usampler1D usampler2D usampler3D usampler2DRect usamplerBuffer usamplerCube isampler1DArray usampler2DARRAY usamplerCubeArray usampler2DMS usampler2DMSArray
    isampler1D isampler2D isampler3D isampler2DRect isamplerCube isamplerBuffer isampler1DArray isampler2DARRAY isamplerCubeArray isampler2DMS isampler2DMSArray
    sampler1D sampler2D sampler3D sampler2DRect samplerCube samplerBuffer sampler1DArray sampler2DArray samplerCubeArray sampler2DMS sampler2DMSArray
    
    gl_Position gl_FragCoord
    gl_VertexID gl_InstanceID gl_PointSize gl_ClipDistance
    gl_TexCoord gl_FogFragCoord gl_ClipVertex gl_in gl_out gl_PerVertex
    gl_PatchVerticesIn
    gl_PrimitiveID gl_InvocationID gl_TessLevelOuter gl_TessLevelInner gl_TessCoord
    gl_InvocationID gl_PrimitiveIDIn gl_Layer gl_ViewportIndex gl_FrontFacing
    gl_PointCoord gl_SampleID gl_SamplePosition gl_FragColor
    gl_FragData gl_FragDepth gl_SampleMask
    gl_NumWorkGroups gl_WorkGroupSize gl_WorkGroupID gl_LocalInvocationID gl_GlobalInvocationID gl_LocalInvocationIndex
    gl_HelperInvocation gl_CullDistance
    gl_VertexIndex gl_InstanceIndex
    
    gl_BaseVertexARB gl_BaseInstanceARB gl_DrawIDARB
    
    gl_SubGroupInvocationARB gl_SubGroupEqMaskARB gl_SubGroupGeMaskARB gl_SubGroupGtMaskARB gl_SubGroupLeMaskARB gl_SubGroupLtMaskARB
    gl_SubGroupSizeARB
    
    gl_ViewportMask
    gl_SecondaryPositionNV gl_SecondaryViewportMaskNV
    gl_ThreadInWarpNV gl_ThreadEqMaskNV gl_ThreadGeMaskNV gl_ThreadGtMaskNV gl_ThreadLeMaskNV gl_ThreadLtMaskNV gl_WarpIDNV gl_SMIDNV gl_HelperThreadNV
    gl_WarpSizeNV gl_WarpsPerSMNV gl_WarpsPerSMNV
]]

-- keywords - shouldn't be left out
for w in keyw:gmatch("([a-zA-Z_0-9]+)") do
    api[w] = {type="keyword"}
end

return api


