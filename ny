import React, { useState, useEffect } from 'react';
import { 
  ChevronRight, 
  ChevronDown,
  ArrowRight, 
  MapPin, 
  Menu, 
  X, 
  CheckCircle2, 
  ShieldCheck, 
  Clock, 
  Star,
  Plus,
  Minus,
  Instagram,
  Linkedin,
  Activity,
  BrainCircuit,
  AlertCircle,
  Stethoscope,
  Pill,
  FileText,
  Scale,
  BookOpen,
  HeartHandshake,
  TrendingUp,
  User,
  Quote,
  Flame,
  Dna,
  Phone,
  CreditCard,
  Calendar,
  Package,
  Microscope,
  HelpCircle,
  Check,
  Truck,
  Layout
} from 'lucide-react';

// --- ASSETS ---

const IMAGES = {
  hero_main: "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=2070&auto=format&fit=crop", 
  glp1_hero: "https://images.unsplash.com/photo-1511632765486-a01980e01a18?q=80&w=2070&auto=format&fit=crop", 
  hormone_hero: "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=2070&auto=format&fit=crop", 
  skin_hero: "https://images.unsplash.com/photo-1616394584738-fc6e612e71b9?q=80&w=2070&auto=format&fit=crop", 
  blood_hero: "https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=2080&auto=format&fit=crop",
  dr_rostova: "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?q=80&w=2070&auto=format&fit=crop",
  dr_chen: "https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=2128&auto=format&fit=crop",
  clinic_interior: "https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=2068&auto=format&fit=crop",
  clinic_lounge: "https://images.unsplash.com/photo-1600607686527-6fb886090705?q=80&w=2000&auto=format&fit=crop"
};

// --- DATA ---

const CONDITIONS = [
  "Insulin Resistance", "Andropause (Low T)", "PCOS", "Perimenopause", 
  "Metabolic Syndrome", "Chronic Fatigue", "Thyroid Dysfunction", "Adrenal Fatigue",
  "Post-Viral Fatigue", "Stubborn Visceral Fat", "Low Libido", "Skin Laxity"
];

const SERVICES = [
  {
    id: 'metabolic',
    title: 'Medical Weight Loss',
    sub_title: 'GLP-1 Metabolic Program',
    tagline: 'Lose fat, keep muscle, reset your biology.',
    price: '$299',
    period: '/month',
    image: IMAGES.glp1_hero,
    category: 'Metabolic Health',
    icon: Scale, 
    desc: 'Weight loss is not about willpower; it is about biology. Our doctor-led program uses advanced medication to lower your "set point" weight while protecting your energy and muscle mass.',
    symptoms: ["Food noise/cravings", "BMI > 27", "Low energy after meals"],
    clinical_mechanism: {
      title: "The Science, Simplified",
      content: "We use GLP-1 medications (like Semaglutide) to quiet the 'food noise' in your brain and regulate insulin. Unlike crash diets that trigger starvation mode (muscle loss), our protocol includes amino acid support to ensure the weight you lose is actually fat."
    },
    timeline: [
      { month: "Month 1", title: "Adaptation", desc: "Your body adjusts to the medication. Appetite decreases. Initial water weight drop." },
      { month: "Month 3", title: "Optimization", desc: "Steady fat loss (1-2 lbs/week). Metabolic markers like insulin begin to improve." },
      { month: "Month 6", title: "Transformation", desc: "Significant body composition change. Discussion of maintenance dosing begins." }
    ],
    whats_included: [
      { item: "Medication", desc: "Semaglutide or Tirzepatide" },
      { item: "Metabolic Labs", desc: "Comprehensive blood panel" },
      { item: "Provider Access", desc: "Unlimited messaging" },
      { item: "Supplies", desc: "Needles & alcohol pads" }
    ],
    comparison: {
      headers: ["Metric", "Diet Alone", "NU Health GLP-1"],
      rows: [
        { metric: "Weight Loss", standard: "3-5%", nu: "15-20%" },
        { metric: "Sustainability", standard: "Low", nu: "High" },
        { metric: "Medical Safety", standard: "None", nu: "Doctor-Led" }
      ]
    },
    safety_profile: {
      contraindications: [" thyroid cancer history", "MEN2", "Pancreatitis"],
      side_effects: "Nausea, fatigue (transient)",
      fda_note: "Compounded medications from 503A/B pharmacies."
    },
    faqs: [
      { q: "Is this cheating?", a: "No. Obesity is a disease. We treat it medically." },
      { q: "Will I lose muscle?", a: "Not with our protein-sparing protocol." }
    ],
    studies: [
      { title: "STEP 1 Trial (NEJM)", result: "14.9% average weight loss with Semaglutide vs 2.4% placebo." }
    ],
    glossary: [
      { term: "GLP-1", def: "A hormone that regulates appetite and insulin." },
      { term: "Set Point", def: "The weight your body fights to maintain." },
      { term: "Titration", def: "Slowly increasing dose to minimize side effects." }
    ],
    reviews: [
      { user: "Michael D.", text: "Down 42lbs. The doctor explained WHY I couldn't lose weight before." },
      { user: "Sarah L.", text: "I was scared of injections, but the team walked me through it." }
    ],
    pricing_tiers: [
      { name: "Semaglutide Base", price: "$299/mo", includes: ["Medication", "Provider Access", "Supplies"] },
      { name: "Tirzepatide Plus", price: "$449/mo", includes: ["Dual-Action Meds", "Body Scans", "Priority Support"] }
    ]
  },
  {
    id: 'hormones',
    title: 'Hormone Optimization',
    sub_title: 'Bio-Identical HRT/TRT',
    tagline: 'Feel like yourself again.',
    price: '$199',
    period: '/month',
    image: IMAGES.hormone_hero,
    category: 'Vitality',
    icon: Flame, 
    desc: 'Restore your hormones to optimal levels to regain energy, focus, and drive. We use bio-identical compounds that match your body perfectly.',
    symptoms: ["Brain fog", "Low libido", "Poor sleep", "Anxiety"],
    clinical_mechanism: {
      title: "Why Hormones Matter",
      content: "Hormones are your body's instruction manual. When levels drop, your body forgets how to sleep, build bone, or burn fat. We use bio-identical hormones—exact molecular matches to what your body makes—to bring you back to balance."
    },
    timeline: [
      { month: "Week 2", title: "Clarity", desc: "Improved sleep quality and mental focus. Brain fog begins to lift." },
      { month: "Week 6", title: "Energy", desc: "Noticeable increase in endurance, libido, and mood stability." },
      { month: "Month 4", title: "Physique", desc: "Improved muscle tone and reduced body fat with regular exercise." }
    ],
    whats_included: [
      { item: "Custom HRT/TRT", desc: "Cream, injectable, or pellet" },
      { item: "Safety Labs", desc: "PSA & Hematocrit monitoring" },
      { item: "Supplies", desc: "Administration kit" },
      { item: "Consults", desc: "Quarterly reviews" }
    ],
    comparison: {
      headers: ["Feature", "Synthetic", "NU Bio-Identical"],
      rows: [
        { metric: "Structure", standard: "Modified", nu: "Exact Match" },
        { metric: "Safety", standard: "Higher Risk", nu: "Physiological" },
        { metric: "Dosing", standard: "Fixed", nu: "Custom" }
      ]
    },
    safety_profile: {
      contraindications: ["Active cancer", "Uncontrolled heart issues"],
      side_effects: "Acne, fluid retention (manageable)",
      fda_note: "Prescribed based on medical necessity."
    },
    faqs: [
      { q: "Is it safe?", a: "Yes, when monitored by a specialist." },
      { q: "For women too?", a: "Yes, highly effective for perimenopause." }
    ],
    studies: [
        { title: "TRAVERSE Study", result: "Testosterone therapy shows no increased cardiac risk in hypogonadal men." }
    ],
    glossary: [
        { term: "Bio-Identical", def: "Plant-derived hormones matching human structure." },
        { term: "Free T", def: "Unbound testosterone available for use." }
    ],
    reviews: [
        { user: "James T.", text: "I thought I was just getting old. Turns out my T was 250. Now it's 800." }
    ],
    pricing_tiers: [
      { name: "TRT Injectable", price: "$199/mo", includes: ["Testosterone", "Syringes", "Lab Review"] },
      { name: "BHRT Cream", price: "$229/mo", includes: ["Custom Cream", "Daily Application", "Symptom Tracking"] }
    ]
  },
  {
    id: 'longevity',
    title: 'Longevity Diagnostics',
    sub_title: 'Advanced Biomarker Analysis',
    tagline: 'Stop guessing. Start measuring.',
    price: '$450',
    period: '/panel',
    image: IMAGES.blood_hero,
    category: 'Prevention',
    icon: Dna, 
    desc: 'Deep-dive 60+ biomarker analysis to detect risk factors years before they become disease. Proactive, data-driven medicine.',
    symptoms: ["Family history", "Curiosity", "Optimization mindset"],
    clinical_mechanism: {
      title: "Proactive vs. Reactive",
      content: "Most doctors only flag issues when you are already sick. We look for 'optimal' ranges, not just 'normal' ones. We test for inflammation, insulin resistance, and heart health markers that standard physicals ignore."
    },
    timeline: [
      { month: "Day 1", title: "Collection", desc: "Blood draw and optional genetic saliva collection." },
      { month: "Day 10", title: "Analysis", desc: "Our team reviews your data against longevity benchmarks." },
      { month: "Day 14", title: "Roadmap", desc: "You receive a comprehensive plan covering diet, supplements, and meds." }
    ],
    whats_included: [
      { item: "60+ Markers", desc: "Heart, Metabolic, Hormone" },
      { item: "Physician Review", desc: "90-minute video call" },
      { item: "Action Plan", desc: "PDF roadmap for supplements" },
      { item: "Insurance", desc: "Superbill provided" }
    ],
    comparison: {
      headers: ["Metric", "Annual Physical", "NU Longevity"],
      rows: [
        { metric: "Depth", standard: "15 markers", nu: "60+ markers" },
        { metric: "Goal", standard: "Find Disease", nu: "Optimize" },
        { metric: "Time", standard: "10 mins", nu: "60+ mins" }
      ]
    },
    safety_profile: {
      contraindications: ["None"],
      side_effects: "None",
      fda_note: "Diagnostic service."
    },
    faqs: [
      { q: "Does insurance cover?", a: "We provide a superbill for reimbursement." },
      { q: "How often?", a: "Annually for maintenance." }
    ],
    studies: [],
    glossary: [
        { term: "ApoB", def: "Advanced cholesterol marker." },
        { term: "HbA1c", def: "3-month blood sugar average." }
    ],
    reviews: [
        { user: "Elena R.", text: "My PCP said my labs were 'normal'. NU Health found high ApoB and we fixed it." }
    ],
    pricing_tiers: [
      { name: "Essential Panel", price: "$450", includes: ["60 Biomarkers", "Doctor Review", "Action Plan"] },
      { name: "Elite Genome", price: "$1,200", includes: ["Essential Panel", "Full DNA Test", "Cancer Screen"] }
    ]
  }
];

const MEMBERSHIPS = [
  {
    title: "Essential",
    price: "$199/mo",
    features: ["1 IV Drip / mo", "10% off Supplements", "Quarterly Labs", "Priority Booking"]
  },
  {
    title: "Performance",
    price: "$399/mo",
    features: ["2 IV Drips / mo", "GLP-1 Management", "15% off Services", "Bi-Annual Body Scan", "Sauna Access"],
    popular: true
  },
  {
    title: "Longevity",
    price: "$599/mo",
    features: ["Full Genome Analysis", "Unlimited LED Therapy", "Peptide Protocols", "Direct MD Access", "Executive Physical"]
  }
];

const REVIEWS = [
  { user: "Michael D.", text: "Down 42lbs. The doctor explained WHY I couldn't lose weight before.", stars: 5 },
  { user: "Sarah L.", text: "I was scared of injections, but the team walked me through it. Easy.", stars: 5 },
  { user: "David K.", text: "The detail in the bloodwork review was unlike anything I've seen.", stars: 5 }
];

// --- COMPONENTS ---

const AnnouncementBar = () => (
  <div className="bg-stone-900 text-white text-[10px] md:text-xs font-bold tracking-widest uppercase py-2 text-center overflow-hidden">
    <div className="flex gap-8 justify-center items-center animate-fade-in">
      <span className="flex items-center gap-2"><Truck size={12} /> Free Shipping on Rx</span>
      <span className="hidden md:flex items-center gap-2 text-stone-500">|</span>
      <span className="flex items-center gap-2"><CreditCard size={12} /> HSA/FSA Accepted</span>
      <span className="hidden md:flex items-center gap-2 text-stone-500">|</span>
      <span className="flex items-center gap-2"><ShieldCheck size={12} /> HIPAA Secure</span>
    </div>
  </div>
);

const Button = ({ children, onClick, variant = 'primary', className = '', icon: Icon }) => {
  const base = "group relative overflow-hidden rounded-full font-medium transition-all duration-300 flex items-center justify-center gap-3 px-8 py-3 tracking-wide text-sm active:scale-95 cursor-pointer";
  const styles = {
    primary: "bg-stone-900 text-white hover:bg-stone-800 shadow-md",
    secondary: "bg-white text-stone-900 border border-stone-200 hover:border-stone-900 hover:bg-stone-50",
    outline: "bg-transparent border border-white text-white hover:bg-white hover:text-stone-900",
  };
  return (
    <button onClick={onClick} className={`${base} ${styles[variant]} ${className}`}>
      <span className="relative z-10 flex items-center gap-2">
        {children}
        {Icon && <Icon size={16} className="transition-transform group-hover:translate-x-1" />}
      </span>
    </button>
  );
};

const SectionHeading = ({ sub, title, center = false }) => (
  <div className={`mb-12 ${center ? 'text-center' : ''}`}>
    <span className="text-xs font-bold tracking-widest text-stone-500 uppercase mb-3 block">{sub}</span>
    <h2 className="text-3xl md:text-5xl font-serif text-stone-900 leading-tight">{title}</h2>
  </div>
);

const FAQAccordion = ({ items }) => {
  const [openIndex, setOpenIndex] = useState(null);
  return (
    <div className="space-y-3">
      {items.map((item, i) => (
        <div key={i} className="border border-stone-200 rounded-xl bg-white overflow-hidden">
          <button onClick={() => setOpenIndex(openIndex === i ? null : i)} className="w-full flex justify-between items-center p-5 text-left">
            <span className="font-bold text-stone-900 text-sm">{item.q}</span>
            {openIndex === i ? <Minus size={16} className="text-stone-400" /> : <Plus size={16} className="text-stone-400" />}
          </button>
          {openIndex === i && <div className="p-5 pt-0 text-stone-600 text-sm leading-relaxed border-t border-stone-100 mt-2">{item.a}</div>}
        </div>
      ))}
    </div>
  );
};

const Disclaimer = ({ className = "" }) => (
  <div className={`bg-stone-50 p-6 border border-stone-100 rounded-xl text-[11px] text-stone-500 leading-relaxed ${className}`}>
    <strong className="block text-stone-700 mb-2 flex items-center gap-2 uppercase tracking-widest text-[10px]"><AlertCircle size={12} /> Compliance & Safety</strong>
    <p>Medical services provided by independently owned physician practices. Information on this site is for educational purposes. 
    Prescriptions are subject to medical provider discretion. Individual results may vary. 
    GLP-1 medications may be compounded; they are not FDA-approved brand name medications.</p>
  </div>
);

// --- SECTIONS ---

const Navbar = ({ setPage, activePage, openMenu, selectService }) => {
  const [scrolled, setScrolled] = useState(false);
  const [menuHover, setMenuHover] = useState(false);

  useEffect(() => {
    const handler = () => setScrolled(window.scrollY > 50);
    window.addEventListener('scroll', handler);
    return () => window.removeEventListener('scroll', handler);
  }, []);

  return (
    <nav className={`fixed top-8 w-full z-50 transition-all duration-300 ${scrolled || menuHover ? 'bg-white/95 backdrop-blur-md border-b border-stone-100 py-3 shadow-sm' : 'bg-transparent py-6'}`}>
      <div className="container mx-auto px-6 md:px-12 flex justify-between items-center relative">
        <div onClick={() => setPage('home')} className="cursor-pointer flex items-center gap-3 z-50">
          <div className="w-8 h-8 bg-stone-900 text-white flex items-center justify-center font-serif font-bold text-lg rounded-lg">N</div>
          <span className={`font-bold tracking-tight ${scrolled || activePage !== 'home' || menuHover ? 'text-stone-900' : 'text-stone-900 md:text-white'}`}>NU HEALTH</span>
        </div>

        <div className="hidden md:flex items-center gap-8">
          <div className="relative py-4" onMouseEnter={() => setMenuHover(true)} onMouseLeave={() => setMenuHover(false)}>
            <button className={`text-xs font-bold uppercase tracking-widest hover:opacity-60 flex items-center gap-1 ${scrolled || activePage !== 'home' || menuHover ? 'text-stone-900' : 'text-white'}`}>
              Protocols <ChevronDown size={14} className={`transition-transform duration-300 ${menuHover ? 'rotate-180' : ''}`}/>
            </button>
            <div className={`absolute top-full left-1/2 -translate-x-1/2 w-[500px] bg-white rounded-2xl shadow-xl border border-stone-100 p-6 grid grid-cols-2 gap-8 transition-all duration-300 origin-top ${menuHover ? 'opacity-100 visible translate-y-0' : 'opacity-0 invisible -translate-y-2'}`}>
                <div>
                  <h4 className="text-xs font-bold text-stone-400 uppercase tracking-widest mb-4 flex items-center gap-2"><Activity size={12} /> Optimization</h4>
                  <div className="space-y-2">{SERVICES.slice(0, 2).map(s => (<div key={s.id} onClick={() => { selectService(s); setMenuHover(false); }} className="cursor-pointer hover:bg-stone-50 p-2 rounded-lg"><div className="flex items-center gap-2 mb-1"><s.icon size={14} className="text-stone-900" /><p className="text-sm font-bold text-stone-900">{s.title}</p></div><p className="text-[10px] text-stone-500 pl-6">{s.category}</p></div>))}</div>
                </div>
                <div>
                  <h4 className="text-xs font-bold text-stone-400 uppercase tracking-widest mb-4 flex items-center gap-2"><ShieldCheck size={12} /> Prevention</h4>
                  <div className="space-y-2">{SERVICES.slice(2, 3).map(s => (<div key={s.id} onClick={() => { selectService(s); setMenuHover(false); }} className="cursor-pointer hover:bg-stone-50 p-2 rounded-lg"><div className="flex items-center gap-2 mb-1"><s.icon size={14} className="text-stone-900" /><p className="text-sm font-bold text-stone-900">{s.title}</p></div><p className="text-[10px] text-stone-500 pl-6">{s.category}</p></div>))}</div>
                </div>
            </div>
          </div>
          <button onClick={() => setPage('locations')} className={`text-xs font-bold uppercase tracking-widest hover:opacity-60 ${scrolled || activePage !== 'home' || menuHover ? 'text-stone-900' : 'text-white'}`}>Locations</button>
        </div>

        <div className="flex items-center gap-4">
           <Button variant={scrolled || activePage !== 'home' || menuHover ? 'primary' : 'outline'} className="hidden md:flex py-2 px-5 text-xs" onClick={() => setPage('quiz')}>Patient Portal</Button>
           <button onClick={openMenu} className={`md:hidden ${scrolled || activePage !== 'home' ? 'text-stone-900' : 'text-stone-900 md:text-white'}`}><Menu size={24} /></button>
        </div>
      </div>
    </nav>
  );
};

const Hero = ({ setPage }) => (
  <section className="relative min-h-[90vh] flex items-center bg-stone-900 pt-20">
    <div className="absolute inset-0 z-0">
       <img src={IMAGES.hero_main} className="w-full h-full object-cover opacity-50" alt="Lifestyle" />
       <div className="absolute inset-0 bg-gradient-to-r from-stone-950 via-stone-950/70 to-transparent"></div>
    </div>
    <div className="container mx-auto px-6 md:px-12 relative z-20 pt-12">
      <div className="max-w-2xl">
        <div className="inline-flex items-center gap-2 mb-6 bg-white/10 backdrop-blur border border-white/10 px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-widest text-white">
           <div className="w-2 h-2 rounded-full bg-green-400 animate-pulse"></div> Michigan's Hybrid Institute
        </div>
        <h1 className="text-5xl md:text-7xl font-serif text-white leading-[1.05] mb-6">Healthcare that <br /><span className="italic text-stone-300">actually listens.</span></h1>
        <p className="text-lg text-stone-300 mb-10 max-w-lg leading-relaxed">We bridge the gap between online convenience and in-clinic safety. Doctor-led protocols for weight loss, hormones, and longevity.</p>
        <div className="flex flex-col sm:flex-row gap-4">
          <Button onClick={() => setPage('quiz')} className="bg-white text-stone-900 hover:bg-stone-100 border-none">Check Eligibility</Button>
          <Button variant="outline" onClick={() => setPage('services')}>View Protocols</Button>
        </div>
      </div>
    </div>
  </section>
);

const InsuranceBanner = () => (
  <div className="bg-[#F8F6F4] py-8 border-y border-stone-200">
    <div className="container mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-6 text-center md:text-left">
      <div className="flex items-center gap-4">
        <div className="bg-white p-3 rounded-full shadow-sm">
          <CreditCard size={24} className="text-stone-900" />
        </div>
        <div>
          <p className="font-bold text-stone-900">Insurance & HSA Accepted</p>
          <p className="text-xs text-stone-500">We accept insurance for labs & HSA/FSA for treatments.</p>
        </div>
      </div>
      <div className="flex items-center gap-6 text-stone-400 font-serif text-lg font-bold flex-wrap justify-center">
        <span>BCBS</span>
        <span>Aetna</span>
        <span>Cigna</span>
        <span>United</span>
        <span>Priority</span>
      </div>
    </div>
  </div>
);

const StatsBanner = () => (
  <section className="bg-white py-12 border-b border-stone-100">
     <div className="container mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
        {[
           { val: "2,500+", label: "Patients Optimized" },
           { val: "15,000+", label: "Lbs Lost" },
           { val: "5.0 ★", label: "Google Rating" },
           { val: "2", label: "MI Locations" }
        ].map((s, i) => (
           <div key={i} className="text-center md:text-left border-l-2 border-stone-100 pl-6">
              <p className="text-3xl font-serif text-stone-900 font-bold">{s.val}</p>
              <p className="text-xs font-bold text-stone-400 uppercase tracking-widest">{s.label}</p>
           </div>
        ))}
     </div>
  </section>
);

const TheGap = () => (
  <section className="py-24 bg-white">
     <div className="container mx-auto px-6 md:px-12 grid md:grid-cols-2 gap-16 items-center">
        <div>
           <SectionHeading sub="The Problem" title="Why Modern Healthcare Fails You" />
           <div className="space-y-8">
              {[
                 { title: "Reactive, Not Proactive", desc: "Doctors only treat you once you're sick. We optimize you while you're healthy." },
                 { title: "The 'Normal' Trap", desc: "Lab ranges are based on the average sick population. We aim for 'optimal' ranges." },
                 { title: "Volume Over Value", desc: "The average doctor visit is 7 minutes. Our intakes are 60+ minutes." }
              ].map((item, i) => (
                 <div key={i} className="flex gap-4">
                    <div className="w-10 h-10 rounded-full bg-red-50 text-red-900 flex items-center justify-center shrink-0 font-bold"><X size={20}/></div>
                    <div>
                       <h4 className="font-bold text-stone-900">{item.title}</h4>
                       <p className="text-stone-500 text-sm leading-relaxed">{item.desc}</p>
                    </div>
                 </div>
              ))}
           </div>
        </div>
        <div className="bg-stone-50 p-10 rounded-3xl border border-stone-100">
           <h3 className="text-2xl font-serif mb-6 text-stone-900">The NU Standard</h3>
           <div className="space-y-6">
              {[
                 "In-depth 60-marker blood panels",
                 "Direct text access to your care team",
                 "In-person body composition scanning",
                 "Custom compounding based on biology"
              ].map((item, i) => (
                 <div key={i} className="flex gap-4 items-center">
                    <CheckCircle2 className="text-green-600 shrink-0" size={20} />
                    <span className="font-medium text-stone-800">{item}</span>
                 </div>
              ))}
           </div>
           <Button className="w-full mt-10">Experience the Difference</Button>
        </div>
     </div>
  </section>
);

const Conditions = () => (
  <section className="py-20 bg-stone-900 text-white">
     <div className="container mx-auto px-6 text-center">
        <h2 className="text-3xl font-serif mb-12">Treating the Root Cause of...</h2>
        <div className="flex flex-wrap justify-center gap-4 max-w-4xl mx-auto">
           {CONDITIONS.map((c, i) => (
              <span key={i} className="px-6 py-3 rounded-full border border-stone-700 text-stone-300 text-sm hover:border-white hover:text-white transition-colors cursor-default">
                 {c}
              </span>
           ))}
        </div>
     </div>
  </section>
);

const HowItWorks = () => (
  <section className="py-24 bg-white">
    <div className="container mx-auto px-6 md:px-12 text-center mb-16">
      <h2 className="text-3xl font-serif text-stone-900 mb-4">How It Works</h2>
      <p className="text-stone-500 max-w-lg mx-auto">A seamless, hybrid model designed for real life.</p>
    </div>
    <div className="container mx-auto px-6 md:px-12 grid md:grid-cols-4 gap-8">
      {[
          { title: "Intake", icon: FileText, desc: "5-min health history assessment." },
          { title: "Labs", icon: Microscope, desc: "Bloodwork at a local Quest or LabCorp." },
          { title: "Consult", icon: Stethoscope, desc: "Video review with your specialist." },
          { title: "Treat", icon: Pill, desc: "Meds shipped to your door." }
      ].map((s, i) => (
          <div key={i} className="text-center group">
            <div className="w-16 h-16 bg-stone-50 rounded-full flex items-center justify-center mx-auto mb-6 group-hover:bg-stone-900 group-hover:text-white transition-colors">
                <s.icon size={24} />
            </div>
            <h4 className="font-bold text-stone-900 mb-2">{s.title}</h4>
            <p className="text-sm text-stone-500">{s.desc}</p>
          </div>
      ))}
    </div>
  </section>
);

const ClinicShowcase = () => (
  <section className="py-24 bg-white">
     <div className="container mx-auto px-6">
        <SectionHeading sub="Our Sanctuary" title="Step Inside" center />
        <div className="grid md:grid-cols-2 gap-8 mt-12">
           <div className="relative group overflow-hidden rounded-3xl h-[400px]">
              <img src={IMAGES.clinic_interior} className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" alt="Royal Oak" />
              <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-8">
                 <div className="text-white">
                    <h3 className="text-2xl font-serif">Royal Oak</h3>
                    <p className="text-sm opacity-80">Metabolic & Aesthetics Center</p>
                 </div>
              </div>
           </div>
           <div className="relative group overflow-hidden rounded-3xl h-[400px]">
              <img src={IMAGES.clinic_lounge} className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" alt="Troy" />
              <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent flex items-end p-8">
                 <div className="text-white">
                    <h3 className="text-2xl font-serif">Troy</h3>
                    <p className="text-sm opacity-80">Longevity Lab & Diagnostics</p>
                 </div>
              </div>
           </div>
        </div>
     </div>
  </section>
);

const MedicalBoard = () => (
  <section className="py-24 bg-stone-50">
    <div className="container mx-auto px-6 md:px-12">
      <SectionHeading sub="Clinical Excellence" title="Medical Board" center />
      <div className="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto mt-12">
        <div className="bg-white p-6 rounded-3xl flex gap-6 items-center shadow-sm hover:shadow-md transition-shadow">
          <img src={IMAGES.dr_rostova} className="w-24 h-24 rounded-2xl object-cover" alt="Dr. Rostova" />
          <div>
            <h3 className="text-xl font-serif text-stone-900">Dr. Elena Rostova, MD</h3>
            <p className="text-xs font-bold text-stone-400 uppercase mb-2">Medical Director</p>
            <p className="text-sm text-stone-600">Double board-certified in Internal Medicine and Anti-Aging.</p>
          </div>
        </div>
        <div className="bg-white p-6 rounded-3xl flex gap-6 items-center shadow-sm hover:shadow-md transition-shadow">
          <img src={IMAGES.dr_chen} className="w-24 h-24 rounded-2xl object-cover" alt="Dr. Chen" />
          <div>
            <h3 className="text-xl font-serif text-stone-900">Dr. Sarah Chen, DO</h3>
            <p className="text-xs font-bold text-stone-400 uppercase mb-2">Endocrinology</p>
            <p className="text-sm text-stone-600">Specialist in hormone optimization and metabolic health.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
);

const MembershipTiers = () => (
  <section className="py-24 bg-white">
    <div className="container mx-auto px-6 md:px-12">
      <div className="text-center mb-16">
        <h2 className="text-3xl md:text-4xl font-serif text-stone-900">Membership Options</h2>
        <p className="text-stone-500 mt-4">Consistency is key to biology. Choose your level of support.</p>
      </div>
      
      <div className="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
        {MEMBERSHIPS.map((tier, i) => (
          <div key={i} className={`p-8 rounded-3xl border ${tier.popular ? 'border-stone-900 bg-stone-900 text-white' : 'border-stone-200 bg-white text-stone-900'} flex flex-col relative`}>
            {tier.popular && <div className="absolute top-4 right-4 bg-white text-stone-900 text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-wide">Most Popular</div>}
            <h3 className="text-xl font-serif mb-2">{tier.title}</h3>
            <p className="text-3xl font-bold mb-8">{tier.price}</p>
            <ul className="space-y-4 mb-8 flex-1">
              {tier.features.map((f, j) => (
                <li key={j} className="flex items-center gap-3 text-sm">
                  <CheckCircle2 size={16} className={tier.popular ? "text-stone-400" : "text-stone-900"} /> {f}
                </li>
              ))}
            </ul>
            <Button variant={tier.popular ? "secondary" : "primary"} className="w-full justify-center">Select {tier.title}</Button>
          </div>
        ))}
      </div>
    </div>
  </section>
);

const HomeFAQ = () => (
  <section className="py-24 bg-stone-50">
    <div className="container mx-auto px-6 md:px-12 max-w-3xl">
      <SectionHeading sub="Questions?" title="FAQ" center />
      <FAQAccordion items={[
        { q: "Is NU Health a standard medical clinic?", a: "We are a specialized hybrid practice. We focus specifically on metabolic optimization, hormones, and longevity. We do not replace your Primary Care Physician for acute illness (flu, broken bones), but we often coordinate with them." },
        { q: "Do you accept insurance?", a: "We accept insurance for all lab work (blood panels). The clinical consultation and concierge services are cash-pay, but FSA/HSA eligible." },
        { q: "Do I have to come in person?", a: "For the initial comprehensive diagnostics (Body Scan & Blood Draw), yes. This ensures safety and data accuracy. Follow-ups can be done virtually via our secure portal." }
      ]} />
    </div>
  </section>
);

const ServicesGrid = ({ selectService }) => (
  <section className="py-24 bg-stone-50">
    <div className="container mx-auto px-6 md:px-12">
      <div className="mb-16">
         <span className="text-stone-500 text-xs font-bold uppercase tracking-widest mb-4 block">Protocols</span>
         <h2 className="text-4xl md:text-5xl font-serif text-stone-900">How we can help.</h2>
      </div>

      <div className="grid md:grid-cols-2 gap-8">
        {SERVICES.map((s, i) => (
          <div 
            key={i} 
            onClick={() => selectService(s)}
            className="group relative h-[500px] rounded-2xl overflow-hidden cursor-pointer shadow-sm hover:shadow-2xl transition-all duration-500"
          >
            <img 
              src={s.image} 
              alt={s.title}
              className="absolute inset-0 w-full h-full object-cover transition-transform duration-1000 group-hover:scale-105"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-stone-950/90 via-stone-950/40 to-transparent"></div>
            
            <div className="absolute inset-0 p-8 md:p-12 flex flex-col justify-end text-white">
               <div className="transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                  <div className="flex items-center gap-3 mb-4">
                     <span className="bg-white/20 backdrop-blur px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider border border-white/10">{s.category}</span>
                  </div>
                  <h3 className="text-3xl md:text-4xl font-serif mb-2">{s.title}</h3>
                  <p className="text-stone-300 font-light mb-8 max-w-sm text-sm leading-relaxed line-clamp-2">{s.desc}</p>
                  
                  <div className="inline-flex items-center gap-2 text-xs font-bold uppercase tracking-widest border-b border-white/30 pb-1 group-hover:border-white transition-colors">
                     View Protocol <ArrowRight size={12} />
                  </div>
               </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  </section>
);

const ServiceDetail = ({ service, goBack, openBooking }) => {
  return (
    <div className="bg-white min-h-screen animate-in fade-in slide-in-from-bottom-4 pt-16">
      {/* Sticky Header */}
      <div className="sticky top-8 z-40 bg-white/95 backdrop-blur border-b border-stone-100 py-3 px-6 md:px-12 flex justify-between items-center shadow-sm">
         <button onClick={goBack} className="flex items-center gap-2 text-stone-500 hover:text-stone-900 text-xs font-bold uppercase tracking-wide"><ChevronRight className="rotate-180" size={14} /> Back</button>
         <span className="font-serif font-bold text-stone-900 hidden md:block">{service.title}</span>
         <Button onClick={openBooking} className="py-2 px-5 text-xs">Check Eligibility</Button>
      </div>

      <div className="grid md:grid-cols-12 gap-0">
         {/* Visual */}
         <div className="col-span-12 md:col-span-5 lg:col-span-4 h-[40vh] md:h-[calc(100vh-60px)] md:sticky md:top-[60px] relative order-1">
            <img src={service.image} className="w-full h-full object-cover" alt={service.title} />
            <div className="absolute inset-0 bg-black/20"></div>
            <div className="absolute bottom-8 left-8 text-white">
               <h1 className="text-4xl font-serif mb-2">{service.title}</h1>
               <p className="text-sm opacity-90">{service.tagline}</p>
            </div>
         </div>

         {/* Content - Long Form Scroll */}
         <div className="col-span-12 md:col-span-7 lg:col-span-8 p-6 md:p-16 order-2 bg-white">
            <div className="max-w-3xl mx-auto space-y-20">
               
               {/* Intro */}
               <div>
                  <p className="text-xl text-stone-700 leading-relaxed font-light mb-8">{service.desc}</p>
                  {service.symptoms && (
                     <div className="bg-stone-50 p-6 rounded-2xl border border-stone-100">
                        <h3 className="text-xs font-bold uppercase tracking-widest text-stone-900 mb-4 flex items-center gap-2"><Activity size={14}/> Is this for you?</h3>
                        <div className="grid md:grid-cols-2 gap-3">
                           {service.symptoms.map((s, i) => (<div key={i} className="flex items-center gap-2 text-sm text-stone-600"><CheckCircle2 size={14} className="text-green-600"/> {s}</div>))}
                        </div>
                     </div>
                  )}
               </div>

               {/* Science */}
               <div>
                  <h3 className="text-2xl font-serif text-stone-900 mb-6">{service.clinical_mechanism.title}</h3>
                  <div className="prose prose-stone text-stone-600 leading-relaxed mb-8">
                     <p>{service.clinical_mechanism.content}</p>
                  </div>
                  {/* Glossary */}
                  {service.glossary && (
                     <div className="grid md:grid-cols-3 gap-6 pt-6 border-t border-stone-100">
                        {service.glossary.map((g, i) => (
                           <div key={i}>
                              <p className="font-bold text-stone-900 text-sm mb-1">{g.term}</p>
                              <p className="text-xs text-stone-500 leading-relaxed">{g.def}</p>
                           </div>
                        ))}
                     </div>
                  )}
               </div>

               {/* Timeline */}
               {service.timeline && (
                 <div>
                    <h3 className="text-xs font-bold uppercase tracking-widest text-stone-400 mb-8 flex items-center gap-2"><Clock size={16}/> Expected Timeline</h3>
                    <div className="space-y-8 pl-4 border-l-2 border-stone-100 ml-2">
                       {service.timeline.map((t, i) => (
                          <div key={i} className="relative">
                             <div className="absolute -left-[21px] top-1 w-3 h-3 rounded-full bg-stone-900 ring-4 ring-white"></div>
                             <h4 className="text-sm font-bold text-stone-900 uppercase tracking-wide mb-1">{t.month} - {t.title}</h4>
                             <p className="text-stone-600 text-sm leading-relaxed">{t.desc}</p>
                          </div>
                       ))}
                    </div>
                 </div>
               )}

               {/* What's Included */}
               {service.whats_included && (
                 <div>
                    <h3 className="text-xs font-bold uppercase tracking-widest text-stone-400 mb-6 flex items-center gap-2"><Package size={16}/> What's Included</h3>
                    <div className="grid md:grid-cols-2 gap-4">
                       {service.whats_included.map((item, i) => (
                          <div key={i} className="p-4 border border-stone-100 rounded-xl flex gap-3 items-start">
                             <div className="bg-stone-50 text-stone-900 p-2 rounded-full"><Check size={12} /></div>
                             <div><p className="font-bold text-sm text-stone-900">{item.item}</p><p className="text-xs text-stone-500">{item.desc}</p></div>
                          </div>
                       ))}
                    </div>
                 </div>
               )}

               {/* Pricing */}
               <div>
                  <h3 className="text-xs font-bold uppercase tracking-widest text-stone-400 mb-6">Transparent Pricing</h3>
                  <div className="grid md:grid-cols-2 gap-6">
                     {service.pricing_tiers && service.pricing_tiers.map((tier, i) => (
                        <div key={i} className="border border-stone-200 rounded-xl p-6 hover:border-stone-900 transition-colors">
                           <h4 className="font-bold text-stone-900 mb-2">{tier.name}</h4>
                           <p className="text-2xl font-serif text-stone-900 mb-6">{tier.price}</p>
                           <ul className="space-y-3">
                              {tier.includes.map((item, j) => (
                                 <li key={j} className="text-sm text-stone-600 flex items-center gap-2"><CheckCircle2 size={14} className="text-green-600 shrink-0"/> {item}</li>
                              ))}
                           </ul>
                        </div>
                     ))}
                  </div>
                  <p className="text-xs text-stone-400 mt-4 text-center">* Labs and initial consult fees may apply separately.</p>
               </div>

               {/* Safety */}
               <div className="bg-stone-50 p-8 rounded-2xl border border-stone-200">
                  <h3 className="text-sm font-bold uppercase tracking-widest text-stone-900 mb-6 flex items-center gap-2"><ShieldCheck size={18} className="text-stone-400"/> Safety Profile</h3>
                  <div className="space-y-6 text-sm text-stone-700">
                     <div>
                       <strong className="block text-stone-900 mb-1">Contraindications:</strong>
                       <ul className="list-disc pl-5 space-y-1 text-stone-600">
                         {service.safety_profile.contraindications.map((c, i) => <li key={i}>{c}</li>)}
                       </ul>
                     </div>
                     <div><strong className="block text-stone-900 mb-1">Potential Side Effects:</strong><p className="text-stone-600">{service.safety_profile.side_effects}</p></div>
                     <p className="text-xs text-stone-500 italic pt-4 border-t border-stone-200">{service.safety_profile.fda_note}</p>
                  </div>
               </div>

               {/* FAQ */}
               <div>
                  <h3 className="text-xs font-bold uppercase tracking-widest text-stone-400 mb-6">Common Questions</h3>
                  <FAQAccordion items={service.faqs} />
               </div>

               <Disclaimer />
            </div>
         </div>
      </div>
    </div>
  );
};

const BookingModal = ({ close }) => (
  <div className="fixed inset-0 z-[60] bg-stone-900/50 backdrop-blur-sm flex items-center justify-center p-4 animate-in fade-in">
     <div className="bg-white w-full max-w-md rounded-3xl p-8 shadow-2xl relative">
        <button onClick={close} className="absolute top-6 right-6"><X size={20}/></button>
        <h2 className="text-2xl font-serif mb-6">Select a Time</h2>
        <div className="grid grid-cols-3 gap-3 mb-6">
           {["9:00", "11:00", "1:30", "3:00"].map(t => <button key={t} className="p-2 border rounded-lg hover:bg-stone-900 hover:text-white transition-colors">{t}</button>)}
        </div>
        <Button className="w-full justify-center" onClick={close}>Confirm</Button>
     </div>
  </div>
);

const Quiz = ({ finish }) => {
  const [step, setStep] = useState(0);
  const questions = [
     { q: "What is your primary goal?", opts: ["Weight Loss", "Hormones", "Longevity", "Skin"] },
     { q: "How are your energy levels?", opts: ["Good", "Mid-day Crash", "Low"] },
     { q: "Recent lab work?", opts: ["Yes", "No"] }
  ];

  return (
     <div className="fixed inset-0 z-[60] bg-stone-50 flex flex-col pt-20 animate-in fade-in">
        <div className="w-full h-1 bg-stone-200"><div className="h-full bg-stone-900 transition-all duration-500" style={{ width: `${((step+1)/3)*100}%` }}></div></div>
        <div className="flex-1 flex flex-col items-center justify-center p-6">
           {step < questions.length ? (
              <div className="max-w-md w-full">
                 <h2 className="text-3xl font-serif mb-8 text-center">{questions[step].q}</h2>
                 <div className="space-y-3">
                    {questions[step].opts.map((o, i) => (
                       <button key={i} onClick={() => setStep(step+1)} className="w-full p-4 bg-white border border-stone-200 rounded-xl hover:border-stone-900 transition-all text-left font-medium">{o}</button>
                    ))}
                 </div>
              </div>
           ) : (
              <div className="text-center max-w-md">
                 <div className="w-16 h-16 bg-green-100 text-green-700 rounded-full flex items-center justify-center mx-auto mb-6"><CheckCircle2 size={32}/></div>
                 <h2 className="text-3xl font-serif mb-4">You Qualify</h2>
                 <p className="text-stone-500 mb-8">Based on your answers, you are eligible for a consultation.</p>
                 <Button onClick={finish} className="w-full justify-center">Book Now</Button>
              </div>
           )}
        </div>
        <button onClick={finish} className="absolute top-6 right-6 p-2"><X/></button>
     </div>
  );
};

const Footer = ({ setPage }) => (
  <footer className="bg-stone-950 text-stone-500 py-16 border-t border-stone-900">
     <div className="container mx-auto px-6 text-center md:text-left">
        <div className="flex flex-col md:flex-row justify-between items-center gap-8">
           <div className="text-white font-serif font-bold text-2xl">NU HEALTH.</div>
           <div className="flex gap-6 text-xs font-bold uppercase tracking-widest">
              <span className="cursor-pointer hover:text-white">Privacy</span>
              <span className="cursor-pointer hover:text-white">Terms</span>
              <span className="cursor-pointer hover:text-white">Contact</span>
           </div>
        </div>
        <Disclaimer className="mt-12 bg-stone-900 border-stone-800 text-stone-600 text-left" />
     </div>
  </footer>
);

// --- MAIN APP SHELL ---

const App = () => {
  const [page, setPage] = useState('home');
  const [selectedService, setSelectedService] = useState(null);
  const [menuOpen, setMenuOpen] = useState(false);
  const [showBooking, setShowBooking] = useState(false);

  useEffect(() => { window.scrollTo(0,0); }, [page]);

  const navigateToService = (service) => {
    setSelectedService(service);
    setPage('detail');
  };

  return (
    <div className="font-sans bg-white text-stone-900 selection:bg-stone-900 selection:text-white pb-20 md:pb-0">
      <AnnouncementBar />
      <Navbar setPage={setPage} activePage={page} openMenu={() => setMenuOpen(true)} selectService={navigateToService} />
      
      {showBooking && <BookingModal close={() => setShowBooking(false)} />}
      {page === 'quiz' && <Quiz finish={() => { setPage('home'); setShowBooking(true); }} />}
      
      {/* Mobile Menu */}
      {menuOpen && (
         <div className="fixed inset-0 bg-stone-900 z-[60] text-white p-8 pt-24 animate-in slide-in-from-right flex flex-col">
            <button onClick={() => setMenuOpen(false)} className="absolute top-8 right-8"><X/></button>
            <div className="mb-8">
               <h4 className="text-xs font-bold text-stone-500 uppercase tracking-widest mb-4">Treatments</h4>
               <div className="space-y-4">
                  {SERVICES.map(s => (
                     <button key={s.id} onClick={() => {navigateToService(s); setMenuOpen(false)}} className="block text-xl font-serif text-left">{s.title}</button>
                  ))}
               </div>
            </div>
            <div className="space-y-4 border-t border-stone-800 pt-8">
               <button onClick={() => {setPage('about'); setMenuOpen(false)}} className="block text-sm font-bold uppercase tracking-widest text-left text-stone-400">Philosophy</button>
               <button onClick={() => {setPage('locations'); setMenuOpen(false)}} className="block text-sm font-bold uppercase tracking-widest text-left text-stone-400">Locations</button>
               <button onClick={() => {setPage('quiz'); setMenuOpen(false)}} className="block text-sm font-bold uppercase tracking-widest text-left text-stone-400">Patient Portal</button>
            </div>
         </div>
      )}

      <main>
        {page === 'home' && <HomeContent setPage={setPage} selectService={navigateToService} />}
        {page === 'detail' && selectedService && <ServiceDetail service={selectedService} goBack={() => setPage('home')} openBooking={() => setShowBooking(true)} />}
        {page === 'services' && (
           <div className="pt-24 container mx-auto px-6">
              <h2 className="text-4xl font-serif mb-12">All Protocols</h2>
              <div className="grid md:grid-cols-2 gap-8 pb-24">
                 {SERVICES.map(s => (
                    <div key={s.id} onClick={() => navigateToService(s)} className="cursor-pointer border border-stone-200 rounded-2xl p-6 hover:shadow-lg transition-shadow">
                       <h3 className="text-xl font-bold mb-2">{s.title}</h3>
                       <p className="text-stone-500 text-sm mb-4">{s.desc}</p>
                       <span className="text-xs font-bold uppercase tracking-widest text-stone-900 flex items-center gap-2">View <ArrowRight size={12}/></span>
                    </div>
                 ))}
              </div>
           </div>
        )}
      </main>

      <Footer setPage={setPage} />

      <div className="md:hidden fixed bottom-0 left-0 w-full bg-white border-t border-stone-200 p-4 z-50 flex gap-4 shadow-lg">
         <Button variant="secondary" className="flex-1 py-3 text-xs" onClick={() => window.location.href = 'tel:5555555555'}><Phone size={14}/> Call</Button>
         <Button className="flex-1 py-3 text-xs" onClick={() => setShowBooking(true)}>Book Now</Button>
      </div>
    </div>
  );
};

const HomeContent = ({ setPage, selectService }) => (
  <>
    <Hero setPage={setPage} />
    <InsuranceBanner />
    <StatsBanner />
    <TheGap />
    <Conditions />
    <ServicesGrid selectService={selectService} />
    <HowItWorks />
    <ClinicShowcase />
    <MedicalBoard />
    <MembershipTiers />
    <HomeFAQ />
  </>
);

export default App;
