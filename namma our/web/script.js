let currentUserName = "Mani Kandan Iron";

function doLogin() {
  const email = document.getElementById('login-email').value;
  if(email) { currentUserName = email.split('@')[0]; }
  updateProfileName();
  showScreen('home-screen');
}

function doSignup() {
  const name = document.getElementById('signup-name').value;
  if(name) { currentUserName = name; }
  updateProfileName();
  showScreen('home-screen');
}

function updateProfileName() {
  const capName = currentUserName.charAt(0).toUpperCase() + currentUserName.slice(1);
  document.getElementById('profile-main-name').innerText = capName;
  document.getElementById('profile-appbar-name').innerText = capName;
  document.getElementById('edit-name-input').value = capName;
  
  const myPostName = document.getElementById('my-post-name');
  if(myPostName) myPostName.innerText = capName;
}

function saveProfile() {
  const newName = document.getElementById('edit-name-input').value;
  if(newName) { currentUserName = newName; updateProfileName(); }

  const bioText = document.getElementById('edit-bio-input').value;
  const bioElement = document.getElementById('profile-bio');
  if(bioElement) {
     if(bioText.trim() !== "") {
         bioElement.innerText = bioText;
         bioElement.style.display = 'block';
     } else {
         bioElement.style.display = 'none';
     }
  }

  showScreen('profile-screen');
}

function doLink(btn, isPrivate) {
  event.stopPropagation();
  flashIcon(btn);
  if(btn.classList.contains('linked')) {
     btn.innerHTML = "Link <i class='fa-solid fa-link'></i>";
     btn.classList.remove('linked');
  } else {
     btn.innerHTML = isPrivate ? "Requested <i class='fa-solid fa-clock'></i>" : "Linked <i class='fa-solid fa-check'></i>";
     if(!isPrivate) btn.classList.add('linked');
  }
}

function showScreen(screenId) {
  try {
     if(typeof event !== 'undefined' && event && event.currentTarget) { flashIcon(event.currentTarget); }
  } catch(e) {}
  
  setTimeout(() => {
    document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
    document.getElementById(screenId).classList.add('active');
    updateGlobalNavVisibility(screenId);
  }, 100);
}

function doLogout() {
  document.getElementById('login-email').value = '';
  document.getElementById('signup-name').value = '';
  showScreen('login-screen');
}

function updateGlobalNavVisibility(screenId) {
  const bNav = document.getElementById('global-bottom-nav');
  if(screenId === 'home-screen' || screenId === 'messages-screen' || screenId === 'profile-screen' || screenId === 'other-profile-screen') {
     bNav.style.display = 'flex';
  } else {
     bNav.style.display = 'none';
  }
}

function navTo(screenId) {
  document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
  if(event && event.currentTarget) {
      event.currentTarget.classList.add('active');
      flashIcon(event.currentTarget);
  }
  if(screenId === 'home-screen') {
     document.getElementById('nav-btn-home').classList.add('active');
     document.getElementById('feed-container').scrollTop = 0;
  } else if (screenId === 'messages-screen') {
     document.getElementById('nav-btn-messages').classList.add('active');
  }
  setTimeout(() => {
    document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
    document.getElementById(screenId).classList.add('active');
  }, 100);
}

function openChat(name, initial, colorClass) {
   // Prevent opening chat if dealing with Unknown block
   if(name === 'Unknown User') return;
   
   document.getElementById('chat-header-name').innerText = name;
   const img = document.getElementById('chat-header-img');
   img.className = "avatar " + colorClass;
   img.innerText = initial;
   showScreen('chat-screen');
}

// OTHER PROFILE LOGIC
function openOtherProfile(name, initial, colorClass) {
    if(name === 'Unknown User') return;
    document.getElementById('other-appbar-name').innerText = name;
    document.getElementById('other-main-name').innerText = name;
    document.getElementById('other-post-title').innerText = name;
    
    const pic = document.getElementById('other-profile-pic');
    pic.className = "profile-pic " + colorClass;
    pic.innerText = initial;
    
    // reset link btn
    const btn = document.getElementById('other-link-btn');
    btn.innerHTML = "<i class='fa-solid fa-link'></i> Link";
    btn.classList.remove('linked');
    
    showScreen('other-profile-screen');
}


function openCommentModal() {
  if (event && event.currentTarget) flashIcon(event.currentTarget);
  document.getElementById('comment-modal').style.display = 'flex';
}
function closeCommentModal() {
  document.getElementById('comment-modal').style.display = 'none';
}

function openCreatePostModal() {
  flashIcon(event.currentTarget);
  document.getElementById('create-post-modal').style.display = 'flex';
}


// CHAT LIST MENU && LOGIC
let currentContextChatEl = null;

function openChatUserActions(e, name, element) {
  e.preventDefault(); // allow right click / long press override
  currentContextChatEl = element;
  
  const isPinned = element.classList.contains('pinned');
  const isBlocked = element.classList.contains('blocked');

  const mainName = isBlocked ? "Unknown User" : name;
  document.getElementById('chat-action-name').innerText = mainName;
  
  document.getElementById('chat-action-pin-text').innerText = isPinned ? "Unpin" : "Pin";
  
  document.getElementById('chat-user-modal').style.display = 'flex';
}

function handleChatAction(action) {
  if(!currentContextChatEl) return;
  const modal = document.getElementById('chat-user-modal');
  
  if (action === 'delete') {
      currentContextChatEl.remove();
  } 
  else if (action === 'pinToggle') {
      const isPinned = currentContextChatEl.classList.contains('pinned');
      const titleEl = currentContextChatEl.querySelector('h4');
      
      if(isPinned) {
          currentContextChatEl.classList.remove('pinned');
          const pIcon = titleEl.querySelector('.pin-icon');
          if(pIcon) pIcon.remove();
          // Move to bottom of the container
          currentContextChatEl.parentNode.appendChild(currentContextChatEl);
      } else {
          currentContextChatEl.classList.add('pinned');
          titleEl.innerHTML += ' <i class="fa-solid fa-thumbtack pin-icon" style="color:#64748b; font-size:12px; margin-left:5px; transform:rotate(45deg);"></i>';
          // Move to top of the container
          currentContextChatEl.parentNode.prepend(currentContextChatEl);
      }
  }
  else if (action === 'block') {
      currentContextChatEl.classList.add('blocked');
      currentContextChatEl.classList.remove('pinned'); // automatically unpin if blocked
      const titleEl = currentContextChatEl.querySelector('h4');
      titleEl.innerHTML = 'Unknown User';
      titleEl.style.color = "#94a3b8";
      currentContextChatEl.querySelector('.avatar').innerText = "?";
      currentContextChatEl.querySelector('.avatar').style.backgroundColor = "#e2e8f0";
      currentContextChatEl.querySelector('.avatar').style.color = "white";
  }
  
  modal.style.display = 'none';
}


// Message Bubble Menu
function openMsgActions(e) {
  e.preventDefault();
  document.getElementById('msg-action-modal').style.display = 'flex';
}

function flashIcon(element) {
  let target = element.querySelector('i') || element;
  if(target && target.classList) {
    target.classList.remove('react-anim');
    void target.offsetWidth;
    target.classList.add('react-anim');
  }
}

function toggleLike(btn) {
  flashIcon(btn);
  btn.classList.toggle('liked');
  const icon = btn.querySelector('i');
  if (btn.classList.contains('liked')) {
    icon.classList.remove('fa-regular');
    icon.classList.add('fa-solid');
  } else {
    icon.classList.remove('fa-solid');
    icon.classList.add('fa-regular');
  }
}

function toggleSearch(forceClose = false) {
  const searchContainer = document.getElementById('search-bar-container');
  const feedContainer = document.getElementById('feed-container');
  const resList = document.getElementById('search-results-list');
  if (event && event.currentTarget && !forceClose) { flashIcon(event.currentTarget); }
  
  if (forceClose || searchContainer.style.display === 'block') {
    searchContainer.style.display = 'none';
    feedContainer.style.paddingTop = '15px';
    if(resList) resList.style.display = 'none';
  } else {
    searchContainer.style.display = 'block';
    searchContainer.querySelector('input').focus();
    feedContainer.style.paddingTop = '5px';
  }
}

const friendsDatabase = [
  "AKILAN B","AKSHAYA LAKSHMI S","BAREETH B","CHANDRU R","DEEPA ROSHINI V","DHYANESH S V","DURGA R","ELAKKIYAN E","GOKUL K","HARISHA S","JANANI M",
  "JAYASRI S","JESSICA ROSSLIN P","JOHNSON ANTONY J","KABILAN T","KANMANI P","KARTHIKA C","KAVIPRIYA A","KEERTHANA K","KIRUBA SHREE P","KOWSHIKA A",
  "LAKSHANA PRIYA K","LAKSHMI PRIYA G","LAKSHMILAVANYA N","LOGESHWARAN G","LOKHI RAJAN R","MADHUSRI M","MANIKANDAN G","MANIKANDAN R","MANO RANJAN P",
  "MOHAMED AZFAR YOUSUF A","MONIKA R J","MUHILAN K","NAVANEETHA R","NAVEEN E","NAVEEN KUMAR A C","NAVEEN RAJ K","NAVEENKUMAR G","PADMAPRIYA R N",
  "PRADHIKSHA S","PRIYADHARSHAN A","RESHMA J","RITHIKA K","SANJAY KUMAR R","SANTHOSH K","SAROJINI BANU P","SHARMILI N","SHRI KIRUTHIKA B M",
  "SHRIRAAM K C","SIVA ABINESH S","SRI AAKASH A","SRINIVASAN V","SUBRAMANI R","SURENDAR G","VAISHNAVI J","VEERAHARISH R","VISHNU G","VISHVA M",
  "VISVESHWARAN R","VYSHALI S","PRATHIKSHA G","RAKSHANA S"
];
const bgColors = ["blue-bg", "green-bg", "orange-bg", "accent-bg"];

function handleSearch() {
   const q = document.getElementById('global-search-input').value.toLowerCase().trim();
   const resList = document.getElementById('search-results-list');
   resList.innerHTML = '';
   if(q.length === 0) { resList.style.display = 'none'; return; }
   
   const matches = friendsDatabase.filter(name => name.toLowerCase().includes(q));
   if(matches.length === 0) {
       resList.style.display = 'block';
       resList.innerHTML = '<div style="padding:15px; color:#64748b; font-size:14px; text-align:center;">No people found</div>';
       return; 
   }
   
   resList.style.display = 'block';
   matches.forEach((name, i) => {
       const initial = name.charAt(0).toUpperCase();
       const colorClass = bgColors[i % bgColors.length];
       
       const item = document.createElement('div');
       item.className = 'search-result-item';
       item.innerHTML = `<div class="avatar ${colorClass}">${initial}</div><div style="font-weight:600; font-size:15px; color:#1e293b;">${name}</div>`;
       
       item.onclick = function() {
           document.getElementById('global-search-input').value = '';
           toggleSearch(true);
           openOtherProfile(name, initial, colorClass);
       };
       resList.appendChild(item);
   });
}
