// CV — one-column, Remco-style header (Typst)
// Build locally: `./cv/build_typst.sh`

#set page(
  paper: "a4",
  margin: (top: 10mm, bottom: 10mm, left: 12mm, right: 12mm),
)

// Keep system font for portability
#set text(size: 10.1pt)
#set par(leading: 0.62em, spacing: 0.22em)
#set heading(numbering: none)
#set list(marker: "•", indent: 12pt, spacing: 2.1pt)

#let accent = rgb("6D28D9") // purple like the reference
#let muted = rgb("475569")
#let rule = rgb("CBD5E1")
#let loc = rgb("DC2626")    // red for locations

// ------------------ Blocks ------------------
#let section(title) = [
  #block(above: 8pt, below: 0pt)[
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      align: (left, center),
      [#text(size: 16pt, weight: "bold", fill: accent)[#title]],
      [#line(length: 100%, stroke: (paint: accent, thickness: 1.1pt))],
    )
  ]
  #v(6pt)
]

// Small uppercase role line
#let caps_line(t) = [
  #text(fill: accent, weight: "semibold", tracking: 1.2pt, size: 10.2pt)[#upper(t)]
]

// Avatar
#let avatar(path) = [
  #box(
    width: 30mm,
    height: 30mm,
    radius: 999pt,
    clip: true,
    stroke: (paint: rule, thickness: 0.9pt),
  )[
    #image(path, width: 30mm, height: 30mm, fit: "cover")
  ]
]

// Small header icon (baseline-friendly)
#let icon(path, h: 9pt) = [
  #box(height: h)[#image(path, height: h, fit: "contain")]
]

// Separator used in header rows
#let sep = [#h(3pt) #text(fill: muted)[|] #h(7pt)]

// Compact Experience row:
// Col1: org + (ROLE • location) in max 2 lines
// Col2: dates + location in max 2 lines
// Col3: narrower
#let exp_compact(org, role, location, dates, body) = [
  #grid(
    // tighter + bring col2 closer
    columns: (0.3fr, 0.15fr, 0.55fr),
    gutter: 7pt,
    align: (left, left),

    [
      #text(weight: "bold")[#org]
      #v(1.5pt)
      #text(size: 8.6pt, fill: muted, weight: "semibold", tracking: 0.9pt)[
        #upper(role)
      ]
    ],

    [
      #text(size: 9.1pt, fill: muted, style: "italic")[#dates]
      #v(1.5pt)
      #text(size: 9.1pt, fill: loc, style: "italic")[#location]
    ],

    [
      #set par(leading: 0.54em, spacing: 0.14em)
      #body
    ],
  )
  #v(5pt)
]

// Education row
#let edu(school, degree, location, dates, bullets: none) = [
  #grid(
    columns: (1fr, auto),
    gutter: 10pt,
    align: (left, right),

    [
      #text(weight: "bold")[#school]
      #v(1pt)
      #text(fill: muted)[#degree]
      #if bullets != none [
        #v(2pt)
        #set list(indent: 12pt, spacing: 1.8pt)
        #bullets
      ]
    ],

    [
      #align(right)[
        #text(fill: loc, style: "italic", size: 8.9pt)[#location]
        #v(1pt)
        #text(fill: muted, style: "italic", size: 8.9pt)[#dates]
      ]
    ],
  )
  #v(3pt)
]

// Skills row (like reference)
#let skill(label, items) = [
  #grid(
    columns: (145pt, 1fr),
    gutter: 10pt,
    align: (right, left),
    [#text(weight: "bold")[#label]],
    [#text(fill: muted)[#items]],
  )
]

// Publication item (compact)
#let pub_item(title, authors, venue_line) = [
  #text(weight: "bold")[#title]
  #v(1pt)
  #text(size: 8.8pt, fill: muted)[#authors]
  #v(1pt)
  #text(size: 8.8pt, fill: muted, style: "italic")[#venue_line]
  #v(3pt)
]

// ------------------ HEADER (like reference) ------------------
#grid(
  columns: (auto, 1fr),
  gutter: 14pt,
  align: (left, center),

  [#avatar("../images/profile_picture.jpg")],

  [
    #align(center)[
      #text(size: 28pt, weight: "bold")[Leandro Di Bella]
      #v(3pt)
      #caps_line("Perception & Robotics Engineer | Physical AI for Autonomous Systems")
      #v(7pt)

      // Row 1 (3 items, like the sample)
      #set text(size: 9.0pt)
      📍 #text(fill: muted)[Brussels, Belgium]
      #sep
      #icon("header/at.png", h: 9pt) #h(3pt)
      #link("mailto:leandro.dibella@gmail.com")[#text(fill: muted)[leandro.dibella\@gmail.com]]
      #sep
      🌐 #link("https://leandrodibella.github.io")[#text(fill: muted)[leandrodibella.github.io]]

      #v(4pt)

      // Row 2 (keep it on ONE line; slightly smaller font)
      #set text(size: 8.8pt)
      #icon("header/github.png", h: 9pt) #h(3pt)
      #link("https://github.com/leandro-svg")[#text(fill: muted)[leandro-svg]]
      #sep
      #icon("header/linkedin.png", h: 9pt) #h(3pt)
      #link("https://www.linkedin.com/in/leandro-di-bella-62381413b/")[#text(fill: muted)[leandro-di-bella]]
      #sep
      🎓 #link("https://scholar.google.de/citations?user=f7IDHsgAAAAJ&hl=en")[#text(fill: muted)[Scholar]]
      #sep
      #icon("header/orcid.png", h: 9pt) #h(3pt)
      #link("https://orcid.org/0009-0000-1731-7205")[#text(fill: muted)[ORCID]]
      #sep
      #icon("header/mappx.jpeg", h: 9pt) #h(3pt)
      #link("https://mappx.app")[#text(fill: muted)[mappx.app]]

      #v(7pt)
      #set text(size: 9.2pt)
      #text(fill: muted, style: "italic")[
        “Deployable autonomous perception with temporal consistency and robustness under distribution shift.”
      ]
    ]
  ],
)

#v(8pt)
#line(length: 100%, stroke: (paint: rule, thickness: 0.9pt))
#v(4pt)

// ------------------ CONTENT ------------------
#section("Summary")
#text()[
  PhD candidate looking for a full-time opportunity. Specialized in robotics, physical AI, and computer vision for autonomous systems, with expertise in perception, detection, multi-object tracking, and vision-language models (VLMs). Currently technical lead on drone localization and navigation in a European Defence Fund (EDF) research project, and working on multi-agent motion forecasting using flow-based generative AI. Experienced in deploying real-time perception on embedded platforms (Jetson, TensorRT, #box[C++]).
]

#section("Experience")

#exp_compact(
  "IMEC & VUB (ORIGAMI, European Defence Fund project)",
  "Technical Lead, Robotics & Perception Researcher",
  "Brussels, Belgium",
  "Jan. 2026 – Present",
  [Technical lead for drone autonomy: architected and integrated the full drone platform (hardware, sensing, and autonomy software). Sensor fusion and localization in 3D environments; developing world-model-based methods for autonomous navigation.],
)

#exp_compact(
  "MACQ Mobility (research project)",
  "Computer Vision Researcher",
  "Brussels, Belgium",
  "Jan. 2023 – Jan. 2026",
  [Detection, 3D multi-object tracking, scene understanding, and motion forecasting for autonomous vehicles using generative AI. Achieved \#1 on the KITTI MOT and Waymo motion forecasting benchmarks.],
)

#exp_compact(
  "Mappx",
  "Founder",
  "Brussels, Belgium",
  "Aug. 2025 – Present",
  [Built a map-centric social travel app (Flutter) with FastAPI backend and PostgreSQL.],
)

#exp_compact(
  "MACQ Mobility",
  "Computer Vision Intern",
  "Brussels, Belgium",
  "Aug. 2022 – Oct. 2022",
  [Developed and integrated instance segmentation on NVIDIA Jetson TX2 (Python/C++).],
)

#exp_compact(
  "Vrije Universiteit Brussel",
  "Teaching Assistant",
  "Brussels, Belgium",
  "2022 – 2025",
  [Teaching assistant for Machine Learning and Big Data Processing (2.5 years).],
)

#section("Education")
#edu("ETRO, Vrije Universiteit Brussel (VUB)", "PhD in Engineering Sciences (AI, Computer Vision & Robotics)", "Brussels, Belgium", "2023 – Present")
#edu("ICVSS 2026 (International Computer Vision Summer School)", "Summer school: Computer Vision for Spatial and Physical Intelligence", "Sicily, Italy", "2026")
#edu("Solvay Brussels School", "Advanced Master in Industrial & Technological Management", "Brussels, Belgium", "2025 – Present")
#edu("Bruface (ULB/VUB)", "M.Sc. Electrical Engineering (Information Technology Systems)", "Brussels, Belgium", "2020 – 2023")

#section("Selected publications")
#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  [
    #grid(columns: (auto, 1fr), gutter: 4pt, align: (left, center),
    )
    #v(6pt)

    #pub_item(
      "HybridTrack: A Hybrid Approach for Robust Multi-Object Tracking",
      "L. Di Bella, Y. Lyu, B. Cornelis, A. Munteanu",
      "IEEE Robotics and Automation Letters (RA-L) / ICRA (2025). Ranked #1 on the KITTI MOT benchmark.",
    )
    #pub_item(
      "FlowS: One-Step Motion Prediction via Local Transport Conditioning",
      "L. Di Bella, A. Munteanu, B. Cornelis",
      "IEEE Robotics and Automation Letters (RA-L), accepted (2026). Ranked #1 on the Waymo motion forecasting benchmark.",
    )
  ],

  [
    #grid(columns: (auto, 1fr), gutter: 7pt, align: (left, center),
    )
    #v(5pt)

    #pub_item(
      "ReferGPT: Towards Zero-Shot Referring Multi-Object Tracking",
      "T. Chamiti, L. Di Bella, A. Munteanu, N. Deligiannis",
      "CVPR Workshops (2025)",
    )
    #pub_item(
      "Spectral-Aware Multi-Object Tracking in Harsh Aerial Perception Domains",
      "L. Di Bella, J. Mimassi, L. Denis, A. Munteanu",
      "IEEE ICRA 2026 Workshop S2S",
    )
  ],
)

#section("Research interests")
#text()[
  Perception for autonomous systems, world models for perception and navigation, localization in 3D environments, vision-language-action (VLA) models for robotics.
]

#section("Skills")
#skill("Programming", "Python, C++, CUDA, PyTorch, TensorRT, ONNX, FastAPI, Flutter/Dart")
#skill("ML / Perception", "Detection, instance segmentation, monocular 3D, 2D/3D tracking (MOT), SLAM, Kalman filtering, temporal consistency")
#skill("Vision-language & GenAI", "Grounding / referring tracking, multimodal reasoning, generative motion forecasting")
#skill("Robotics", "ROS 2, SLAM, localization, motion planning, navigation, sensor fusion")
#skill("Systems / Deployment", "Jetson, Docker, GitHub CI/CD, Azure cloud services, Firebase, PostgreSQL")
#skill("Academic service", "Reviewer: TIP, RA-L, ICRA, ICIP, IET")
