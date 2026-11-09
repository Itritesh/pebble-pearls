const p = { id: 1, name: "test", price: 100, inStock: false };
const primaryImg = "test.png";
const imgList = "test.png";
const s = `
    <div class="product-card group cursor-pointer" onclick="navigateTo('product', '${p.id}')" onmouseenter="startCarousel('${p.id}', 0, '${imgList}')" onmouseleave="stopCarousel('${p.id}', '${primaryImg}')">
        <div class="relative aspect-[4/5] overflow-hidden rounded-xl bg-white mb-4 border border-stone-100 relative group">
            <img id="img-prod-${p.id}" src="${primaryImg}" class="product-img w-full h-full object-cover transition-transform" alt="${p.name}">
            ${p.inStock === false ? '<div class="absolute inset-0 bg-white/60 flex items-center justify-center"><span class="bg-black text-white text-[10px] uppercase font-bold tracking-widest px-4 py-2">Out of Stock</span></div>' : ''}
        </div>
        <h4 class="text-base sm:text-lg serif">${p.name}</h4>
        <p class="text-stone-400 text-[10px] font-bold uppercase tracking-widest">₹${p.price.toLocaleString('en-IN')}</p>
        <button onclick="event.stopPropagation(); addToBag('${p.id}')" class="mt-3 text-[9px] uppercase font-bold text-accent tracking-widest border-b border-accent pb-1 relative z-10 ${p.inStock === false ? 'opacity-50 cursor-not-allowed pointer-events-none' : ''}">${p.inStock === false ? 'Unavailable' : 'Add to bag'}</button>
    </div>
`;
console.log("OK");
