function validateForm() {
    let firstName = document.getElementById('fname').value;
    let description = document.getElementById('description').value;
    let projectDate = document.getElementById('project-date').value;
    let email = document.getElementById('email').value;
    let confirmEmail = document.getElementById('confirm-email').value;
    let phoneNumber = document.getElementById('phone').value;
    let contactPreference = document.getElementById('contact-preference').value;

    if (!validateEmails(email, confirmEmail)) {
        return false;
    }

    if (!validateProjectDate(projectDate)) {
        return false;
    }

    let summary = `Please confirm your contact request:\n\n` +
                  `Name: ${firstName}\n` +
                  `Project Description: ${description}\n` +
                  `Project Date: ${projectDate}\n` +
                  `Email: ${email}\n` +
                  `Phone: ${phoneNumber}\n` +
                  `Contact Preference: ${contactPreference}\n`;

    if (confirm(summary)) {
        alert('Thank you for your message. We will contact you soon.');
       
    }
}

function validateEmails(email, confirmEmail) {
    if (email !== confirmEmail) {
        alert('The emails do not match.');
        return false;
    }
    return true;
}

function validateProjectDate(projectDate) {
    let today = new Date();
    let projectDateObj = new Date(projectDate);
    today.setHours(0, 0, 0, 0); 

    if (projectDateObj <= today) {
        alert('The project date must be at least 1 day in the future.');
        return false;
    }
    return true;
}
